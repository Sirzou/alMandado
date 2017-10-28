defmodule AlMandado.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nickname, :string
      add :color, :string
      add :correo, :string
      add :password, :string

      timestamps()
    end

  end
end
