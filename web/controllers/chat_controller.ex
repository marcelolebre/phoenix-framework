defmodule UaChat.ChatController do
  use UaChat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"name" => name}) do
    render conn, "show.html", name: name
  end
end
