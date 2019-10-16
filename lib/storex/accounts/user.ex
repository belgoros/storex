defmodule Storex.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts_users" do
    field :email, :string
    field :full_name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :full_name, :password])
    |> validate_required([:email, :full_name, :password])
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
  end
end
