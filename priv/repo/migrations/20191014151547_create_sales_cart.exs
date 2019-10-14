defmodule Storex.Repo.Migrations.CreateSalesCart do
  use Ecto.Migration

  def change do
    create table(:sales_cart) do

      timestamps()
    end

  end
end
