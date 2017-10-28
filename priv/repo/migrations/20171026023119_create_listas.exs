defmodule AlMandado.Repo.Migrations.CreateListas do
  use Ecto.Migration

  def change do
    create table(:listas) do
      add :fecha, :string
      add :nombre, :string

      timestamps()
    end

  end
end
