defmodule ApiWeb.MeController do
  use ApiWeb, :controller

  alias Api.Jwt

  require IEx

  def index(conn, _params) do
    %{"sub" => sub, "username" => username} =
      conn
      |> Map.get(:req_headers)
      |> Enum.find(fn {k, _} -> k == "authorization" end)
      |> elem(1)
      |> Jwt.decode!()

    IEx.pry()
  end
end
