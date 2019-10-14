defmodule Storex.Sales.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sales_cart" do

    timestamps()
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [])
    |> validate_required([])
  end
end
