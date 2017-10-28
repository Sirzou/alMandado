defmodule AlMandado.Fronts.Usuario do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]
  alias AlMandado.Fronts.Usuario


  schema "usuarios" do
    field :color, :string
    field :correo, :string
    field :nickname, :string
    field :password, :string

    timestamps()
    # Virtual Fields
    field :password_prime, :string, virtual: true
    field :password_confirmation, :string, virtual: true
  end

  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:nickname, :color, :correo, :password_prime, :password_confirmation])
    |> validate_required([:nickname, :color, :correo, :password_prime, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:age, 18..100)
    |> hash_password
  end
  defp hash_password(changeset) do
    if password_prime = get_change(changeset, :password) do
      changeset
      |> put_change(:password, hashpwsalt(password_prime))
    else
      changeset
    end
  end
end
