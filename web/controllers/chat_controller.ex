defmodule UaChat.ChatController do
  use UaChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"name" => name}) do
    conn
      |> put_flash(:info, "Welcome to Phoenix, from flash info!")
      |> put_flash(:error, "Let's pretend we have an error.")
      |> assign(:name, name)
      |> render("show.html")
  end

  def test(conn, %{"id" => id}) do
    json conn, %{id: id}
  end
end
