defmodule Api.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :string, []}
  schema "users" do
    field :name, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:id, :name])
    |> validate_required([:id, :name])
  end
end
