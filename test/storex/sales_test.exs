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
end
