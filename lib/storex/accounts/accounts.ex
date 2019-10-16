defmodule Storex.Accounts do
  import Ecto.Query, warn: false
  alias Storex.Repo
  alias Storex.Accounts.User

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
