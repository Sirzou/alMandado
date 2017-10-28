defmodule AlMandado.Backs do
  @moduledoc """
  The Backs context.
  """

  import Ecto.Query, warn: false
  alias AlMandado.Repo

  alias AlMandado.Backs.Lista

  @doc """
  Returns the list of listas.

  ## Examples

      iex> list_listas()
      [%Lista{}, ...]

  """
  def list_listas do
    Repo.all(Lista)
  end

  @doc """
  Gets a single lista.

  Raises `Ecto.NoResultsError` if the Lista does not exist.

  ## Examples

      iex> get_lista!(123)
      %Lista{}

      iex> get_lista!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lista!(id), do: Repo.get!(Lista, id)

  @doc """
  Creates a lista.

  ## Examples

      iex> create_lista(%{field: value})
      {:ok, %Lista{}}

      iex> create_lista(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lista(attrs \\ %{}) do
    %Lista{}
    |> Lista.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lista.

  ## Examples

      iex> update_lista(lista, %{field: new_value})
      {:ok, %Lista{}}

      iex> update_lista(lista, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lista(%Lista{} = lista, attrs) do
    lista
    |> Lista.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Lista.

  ## Examples

      iex> delete_lista(lista)
      {:ok, %Lista{}}

      iex> delete_lista(lista)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lista(%Lista{} = lista) do
    Repo.delete(lista)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lista changes.

  ## Examples

      iex> change_lista(lista)
      %Ecto.Changeset{source: %Lista{}}

  """
  def change_lista(%Lista{} = lista) do
    Lista.changeset(lista, %{})
  end
end
