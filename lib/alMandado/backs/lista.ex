defmodule AlMandado.Backs.Lista do
  use Ecto.Schema
  import Ecto.Changeset
  alias AlMandado.Backs.Lista


  schema "listas" do
    field :fecha, :string
    field :nombre, :string

    timestamps()
  end

  @doc false
  def changeset(%Lista{} = lista, attrs) do
    lista
    |> cast(attrs, [:fecha, :nombre])
    |> validate_required([:fecha, :nombre])
  end
end
