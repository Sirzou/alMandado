defmodule AlMandado.FrontsTest do
  use AlMandado.DataCase

  alias AlMandado.Fronts

  describe "usuarios" do
    alias AlMandado.Fronts.Usuario

    @valid_attrs %{color: "some color", correo: "some correo", nickname: "some nickname", password: "some password"}
    @update_attrs %{color: "some updated color", correo: "some updated correo", nickname: "some updated nickname", password: "some updated password"}
    @invalid_attrs %{color: nil, correo: nil, nickname: nil, password: nil}

    def usuario_fixture(attrs \\ %{}) do
      {:ok, usuario} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fronts.create_usuario()

      usuario
    end

    test "list_usuarios/0 returns all usuarios" do
      usuario = usuario_fixture()
      assert Fronts.list_usuarios() == [usuario]
    end

    test "get_usuario!/1 returns the usuario with given id" do
      usuario = usuario_fixture()
      assert Fronts.get_usuario!(usuario.id) == usuario
    end

    test "create_usuario/1 with valid data creates a usuario" do
      assert {:ok, %Usuario{} = usuario} = Fronts.create_usuario(@valid_attrs)
      assert usuario.color == "some color"
      assert usuario.correo == "some correo"
      assert usuario.nickname == "some nickname"
      assert usuario.password == "some password"
    end

    test "create_usuario/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fronts.create_usuario(@invalid_attrs)
    end

    test "update_usuario/2 with valid data updates the usuario" do
      usuario = usuario_fixture()
      assert {:ok, usuario} = Fronts.update_usuario(usuario, @update_attrs)
      assert %Usuario{} = usuario
      assert usuario.color == "some updated color"
      assert usuario.correo == "some updated correo"
      assert usuario.nickname == "some updated nickname"
      assert usuario.password == "some updated password"
    end

    test "update_usuario/2 with invalid data returns error changeset" do
      usuario = usuario_fixture()
      assert {:error, %Ecto.Changeset{}} = Fronts.update_usuario(usuario, @invalid_attrs)
      assert usuario == Fronts.get_usuario!(usuario.id)
    end

    test "delete_usuario/1 deletes the usuario" do
      usuario = usuario_fixture()
      assert {:ok, %Usuario{}} = Fronts.delete_usuario(usuario)
      assert_raise Ecto.NoResultsError, fn -> Fronts.get_usuario!(usuario.id) end
    end

    test "change_usuario/1 returns a usuario changeset" do
      usuario = usuario_fixture()
      assert %Ecto.Changeset{} = Fronts.change_usuario(usuario)
    end
  end

  describe "items" do
    alias AlMandado.Fronts.Item

    @valid_attrs %{img: "some img", nombre: "some nombre"}
    @update_attrs %{img: "some updated img", nombre: "some updated nombre"}
    @invalid_attrs %{img: nil, nombre: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fronts.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Fronts.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Fronts.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Fronts.create_item(@valid_attrs)
      assert item.img == "some img"
      assert item.nombre == "some nombre"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fronts.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Fronts.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.img == "some updated img"
      assert item.nombre == "some updated nombre"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Fronts.update_item(item, @invalid_attrs)
      assert item == Fronts.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Fronts.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Fronts.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Fronts.change_item(item)
    end
    
  end
end
