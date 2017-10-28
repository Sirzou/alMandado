defmodule AlMandado.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :nombre, :string
      add :img, :string

      timestamps()
    end

  end
end
