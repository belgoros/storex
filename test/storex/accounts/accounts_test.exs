defmodule Storex.AccountsTest do
  use Storex.DataCase

  alias Storex.Accounts

  @valid_attrs %{
    full_name: "John Doe",
    email: "john.doe@test.tld",
    password: "123456"
  }

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Accounts.create_user()

    user
  end

  describe "accounts_users" do
    alias Storex.Accounts.User

    test "create_user/1 creates a user when data is valid" do
      assert {:ok, %User{}} = Accounts.create_user(@valid_attrs)
    end

    test "create_user/1 does not create a user when data is invalid" do
      existing = user_fixture()

      {:error, changeset} = Accounts.create_user(%{})
      assert "can't be blank" in errors_on(changeset).email
      assert "can't be blank" in errors_on(changeset).password
      assert "can't be blank" in errors_on(changeset).full_name

      {:error, changeset} = Accounts.create_user(%{password: "123"})
      assert "should be at least 6 character(s)" in errors_on(changeset).password

      duplicated_email_attrs = %{@valid_attrs | email: existing.email()}
      {:error, changeset} = Accounts.create_user(duplicated_email_attrs)
      assert "has already been taken" in errors_on(changeset).email
    end
  end
end
