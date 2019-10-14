defmodule Storex.SalesTest do
  use Storex.DataCase

  alias Storex.Sales

  describe "sales_cart" do
    alias Storex.Sales.Cart

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def cart_fixture(attrs \\ %{}) do
      {:ok, cart} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_cart()

      cart
    end

    test "list_sales_cart/0 returns all sales_cart" do
      cart = cart_fixture()
      assert Sales.list_sales_cart() == [cart]
    end

    test "get_cart!/1 returns the cart with given id" do
      cart = cart_fixture()
      assert Sales.get_cart!(cart.id) == cart
    end

    test "create_cart/1 with valid data creates a cart" do
      assert {:ok, %Cart{} = cart} = Sales.create_cart(@valid_attrs)
    end

    test "create_cart/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_cart(@invalid_attrs)
    end

    test "update_cart/2 with valid data updates the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{} = cart} = Sales.update_cart(cart, @update_attrs)
    end

    test "update_cart/2 with invalid data returns error changeset" do
      cart = cart_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_cart(cart, @invalid_attrs)
      assert cart == Sales.get_cart!(cart.id)
    end

    test "delete_cart/1 deletes the cart" do
      cart = cart_fixture()
      assert {:ok, %Cart{}} = Sales.delete_cart(cart)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_cart!(cart.id) end
    end

    test "change_cart/1 returns a cart changeset" do
      cart = cart_fixture()
      assert %Ecto.Changeset{} = Sales.change_cart(cart)
    end
  end

  describe "sales_line_items" do
    alias Storex.Sales.LineItem

    @valid_attrs %{quantity: 42}
    @update_attrs %{quantity: 43}
    @invalid_attrs %{quantity: nil}

    def line_item_fixture(attrs \\ %{}) do
      {:ok, line_item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sales.create_line_item()

      line_item
    end

    test "list_sales_line_items/0 returns all sales_line_items" do
      line_item = line_item_fixture()
      assert Sales.list_sales_line_items() == [line_item]
    end

    test "get_line_item!/1 returns the line_item with given id" do
      line_item = line_item_fixture()
      assert Sales.get_line_item!(line_item.id) == line_item
    end

    test "create_line_item/1 with valid data creates a line_item" do
      assert {:ok, %LineItem{} = line_item} = Sales.create_line_item(@valid_attrs)
      assert line_item.quantity == 42
    end

    test "create_line_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_line_item(@invalid_attrs)
    end

    test "update_line_item/2 with valid data updates the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{} = line_item} = Sales.update_line_item(line_item, @update_attrs)
      assert line_item.quantity == 43
    end

    test "update_line_item/2 with invalid data returns error changeset" do
      line_item = line_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_line_item(line_item, @invalid_attrs)
      assert line_item == Sales.get_line_item!(line_item.id)
    end

    test "delete_line_item/1 deletes the line_item" do
      line_item = line_item_fixture()
      assert {:ok, %LineItem{}} = Sales.delete_line_item(line_item)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_line_item!(line_item.id) end
    end

    test "change_line_item/1 returns a line_item changeset" do
      line_item = line_item_fixture()
      assert %Ecto.Changeset{} = Sales.change_line_item(line_item)
    end
  end
end
