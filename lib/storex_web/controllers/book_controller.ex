defmodule StorexWeb.BookController do
  use StorexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", books: list_books()
  end

  def show(conn, %{"id" => book_id}) do
    render conn, "show.html", book: get_book(book_id)
  end

  def get_book(id) do
    Enum.find(list_books(), fn(book) -> book.id == id end)
  end

  def list_books() do
    [
      %{
        id: "1",
        title: "My first book",
        description: "My first story",
        price: "15.9",
        image_url: "http://www.phoenixforrailsdevelopers.com/books/1.png"
        },
        %{
          id: "2",
          title: "My second book",
          description: "My first story",
          price: "25.9",
          image_url: "http://www.phoenixforrailsdevelopers.com/books/2.png"
        },
        %{
          id: "3",
          title: "My third book",
          description: "My first story",
          price: "35.9",
          image_url: "http://www.phoenixforrailsdevelopers.com/books/3.png"
        },
        %{
          id: "4",
          title: "My fourth book",
          description: "My first story",
          price: "45.9",
          image_url: "http://www.phoenixforrailsdevelopers.com/books/4.png"
        }
    ]
  end
end
