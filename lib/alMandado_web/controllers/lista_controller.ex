defmodule AlMandadoWeb.ListaController do
  use AlMandadoWeb, :controller

  alias AlMandado.Backs
  alias AlMandado.Backs.Lista

  def index(conn, _params) do
    listas = Backs.list_listas()
    render(conn, "index.html", listas: listas)
  end

  def new(conn, _params) do
    changeset = Backs.change_lista(%Lista{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lista" => lista_params}) do
    case Backs.create_lista(lista_params) do
      {:ok, lista} ->
        conn
        |> put_flash(:info, "Lista created successfully.")
        |> redirect(to: lista_path(conn, :show, lista))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lista = Backs.get_lista!(id)
    render(conn, "show.html", lista: lista)
  end

  def edit(conn, %{"id" => id}) do
    lista = Backs.get_lista!(id)
    changeset = Backs.change_lista(lista)
    render(conn, "edit.html", lista: lista, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lista" => lista_params}) do
    lista = Backs.get_lista!(id)

    case Backs.update_lista(lista, lista_params) do
      {:ok, lista} ->
        conn
        |> put_flash(:info, "Lista updated successfully.")
        |> redirect(to: lista_path(conn, :show, lista))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lista: lista, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lista = Backs.get_lista!(id)
    {:ok, _lista} = Backs.delete_lista(lista)

    conn
    |> put_flash(:info, "Lista deleted successfully.")
    |> redirect(to: lista_path(conn, :index))
  end
end
