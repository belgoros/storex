defmodule StorexWeb.BookController do
  use StorexWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", books: list_books()
  end

  def show(conn, %{"id" => book_id}) do
    book = %{
      id: "1",
      title: "My first book",
      description: "My first story",
      price: "15.9",
      image_url: "http://www.phoenixforrailsdevelopers.com/books/1.png"
    }
    render conn, "show.html", book: book
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
