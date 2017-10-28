defmodule AlMandadoWeb.ListaControllerTest do
  use AlMandadoWeb.ConnCase

  alias AlMandado.Backs

  @create_attrs %{fecha: "some fecha", nombre: "some nombre"}
  @update_attrs %{fecha: "some updated fecha", nombre: "some updated nombre"}
  @invalid_attrs %{fecha: nil, nombre: nil}

  def fixture(:lista) do
    {:ok, lista} = Backs.create_lista(@create_attrs)
    lista
  end

  describe "index" do
    test "lists all listas", %{conn: conn} do
      conn = get conn, lista_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Listas"
    end
  end

  describe "new lista" do
    test "renders form", %{conn: conn} do
      conn = get conn, lista_path(conn, :new)
      assert html_response(conn, 200) =~ "New Lista"
    end
  end

  describe "create lista" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, lista_path(conn, :create), lista: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == lista_path(conn, :show, id)

      conn = get conn, lista_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Lista"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, lista_path(conn, :create), lista: @invalid_attrs
      assert html_response(conn, 200) =~ "New Lista"
    end
  end

  describe "edit lista" do
    setup [:create_lista]

    test "renders form for editing chosen lista", %{conn: conn, lista: lista} do
      conn = get conn, lista_path(conn, :edit, lista)
      assert html_response(conn, 200) =~ "Edit Lista"
    end
  end

  describe "update lista" do
    setup [:create_lista]

    test "redirects when data is valid", %{conn: conn, lista: lista} do
      conn = put conn, lista_path(conn, :update, lista), lista: @update_attrs
      assert redirected_to(conn) == lista_path(conn, :show, lista)

      conn = get conn, lista_path(conn, :show, lista)
      assert html_response(conn, 200) =~ "some updated fecha"
    end

    test "renders errors when data is invalid", %{conn: conn, lista: lista} do
      conn = put conn, lista_path(conn, :update, lista), lista: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Lista"
    end
  end

  describe "delete lista" do
    setup [:create_lista]

    test "deletes chosen lista", %{conn: conn, lista: lista} do
      conn = delete conn, lista_path(conn, :delete, lista)
      assert redirected_to(conn) == lista_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, lista_path(conn, :show, lista)
      end
    end
  end

  defp create_lista(_) do
    lista = fixture(:lista)
    {:ok, lista: lista}
  end
end
