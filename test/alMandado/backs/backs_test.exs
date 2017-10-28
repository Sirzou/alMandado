defmodule AlMandado.BacksTest do
  use AlMandado.DataCase

  alias AlMandado.Backs

  describe "listas" do
    alias AlMandado.Backs.Lista

    @update_attrs %{fecha: "27/10/2017", nombre: "Nombre Apellido Otroapellido"}
    @invalid_attrs %{fecha: "27/19/2017", nombre: nil}

    def lista_fixture(attrs \\ %{}) do
      {:ok, lista} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Backs.create_lista()

      lista
    end

    test "list_listas/0 returns all listas" do
      lista = lista_fixture()
      assert Backs.list_listas() == [lista]
    end

    test "get_lista!/1 returns the lista with given id" do
      lista = lista_fixture()
      assert Backs.get_lista!(lista.id) == lista
    end

    test "create_lista/1 with valid data creates a lista" do
      assert {:ok, %Lista{} = lista} = Backs.create_lista(@valid_attrs)
      assert lista.fecha == "some fecha"
      assert lista.nombre == "some nombre"
    end

    test "create_lista/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Backs.create_lista(@invalid_attrs)
    end

    test "update_lista/2 with valid data updates the lista" do
      lista = lista_fixture()
      assert {:ok, lista} = Backs.update_lista(lista, @update_attrs)
      assert %Lista{} = lista
      assert lista.fecha == "some updated fecha"
      assert lista.nombre == "some updated nombre"
    end

    test "update_lista/2 with invalid data returns error changeset" do
      lista = lista_fixture()
      assert {:error, %Ecto.Changeset{}} = Backs.update_lista(lista, @invalid_attrs)
      assert lista == Backs.get_lista!(lista.id)
    end

    test "delete_lista/1 deletes the lista" do
      lista = lista_fixture()
      assert {:ok, %Lista{}} = Backs.delete_lista(lista)
      assert_raise Ecto.NoResultsError, fn -> Backs.get_lista!(lista.id) end
    end

    test "change_lista/1 returns a lista changeset" do
      lista = lista_fixture()
      assert %Ecto.Changeset{} = Backs.change_lista(lista)
    end


    test "changeset with valid attributes" do
      changeset = Lista.changeset(%Lista{}, @valid_attrs)
      assert changeset.valid?
    end

    test "changeset with invalid attributes" do
      changeset = Lista.changeset(%Lista{}, @invalid_attrs)
      refute changeset.valid?
    end
  end
end
