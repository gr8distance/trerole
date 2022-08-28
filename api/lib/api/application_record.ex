defmodule ApplicationRecord do
  defmacro __using__(opts) do
    quote do
      alias unquote(opts[:repo])

      import Ecto.Query

      def all do
        unquote(opts[:schema])
        |> Repo.all()
      end

      def find(id) do
        unquote(opts[:schema])
        |> Repo.get!(id)
      end

      def find_by(conds) do
        unquote(opts[:schema])
        |> Repo.get_by(conds)
      end

      def where(conds) do
        from(unquote(opts[:schema]), where: ^conds)
        |> Repo.all()
      end

      def insert(attr) do
        %unquote(opts[:schema]){}
        |> unquote(opts[:schema]).changeset(attr)
        |> Repo.insert()
      end

      def insert!(attr) do
        %unquote(opts[:schema]){}
        |> unquote(opts[:schema]).changeset(attr)
        |> Repo.insert!()
      end

      def insert_all(maps, opts \\ []) do
        now = DateTime.utc_now() |> NaiveDateTime.truncate(:second)

        changesets =
          maps
          |> Enum.map(fn map -> Map.merge(%{inserted_at: now, updated_at: now}, map) end)

        Repo.insert_all(unquote(opts[:schema]), changesets, opts)
      end

      def update(entity, attr) do
        entity
        |> unquote(opts[:schema]).changeset(attr)
        |> Repo.update()
      end

      def update!(entity, attr) do
        entity
        |> unquote(opts[:schema]).changeset(attr)
        |> Repo.update!()
      end

      def delete(entity), do: Repo.delete(entity)
      def delete!(entity), do: Repo.delete!(entity)

      def delete_all(), do: Repo.delete_all(unquote(opts[:schema]))
    end
  end
end
