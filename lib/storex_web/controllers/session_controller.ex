defmodule StorexWeb.SessionController do
  use StorexWeb, :controller
  alias Storex.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"credentials" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Welcome to Storex")
        |> redirect(to: Routes.cart_path(conn, :show))

      {:error, _} ->
        conn
        |> put_flash(:error, "Unable to sign in")
        |> render("new.html")
    end
  end
end
