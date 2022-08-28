defmodule Api.Contexts.Users do
  use ApplicationRecord,
    schema: Api.Schemas.User,
    repo: Api.Repo

  require IEx

  def find_or_create(sub, name) do
    find_by(id: sub)
    |> find_or_create_by(%{sub: sub, name: name})
  end

  defp find_or_create_by(nil, %{sub: sub, name: name}) do
    insert!(%{id: sub, name: name})
  end

  defp find_or_create_by(user, _), do: user
end
