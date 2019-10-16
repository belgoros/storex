defmodule Storex.AccountsTest do
  use Storex.DataCase

  alias Storex.Accounts

  @valid_attrs %{
    full_name: "John Doe",
    email: "john.doe@test.tld",
    password: "123456"
  }

  describe "accounts_users" do
    alias Storex.Accounts.User

    test "create_user/1 creates a User when data is valid" do
      assert {:ok, %User{}} = Accounts.create_user(@valid_attrs)
    end
  end
end
