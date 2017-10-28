defmodule AlMandado.Fronts.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias AlMandado.Fronts.Item


  schema "items" do
    field :img, :string
    field :nombre, :string

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:nombre, :img])
    |> validate_required([:nombre, :img])
  end
end
