defmodule ApiWeb.MeController do
  use ApiWeb, :controller

  alias Api.Jwt
  alias Api.Contexts.Users

  require IEx

  def index(conn, _params) do
    %{"sub" => sub, "username" => name} =
      conn
      |> Map.get(:req_headers)
      |> Enum.find(fn {k, _} -> k == "authorization" end)
      |> elem(1)
      |> Jwt.decode!()

    user = Users.find_or_create(sub, name)
    json(conn, %{user: %{id: user.id, name: user.name}})
  end
end
