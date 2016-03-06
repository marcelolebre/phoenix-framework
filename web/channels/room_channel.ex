defmodule UaChat.RoomChannel do
  use Phoenix.Channel
  alias UaChat.Message
  alias UaChat.Repo
  require Logger
  import Ecto.Query

  def join("rooms:lobby", _message, socket) do
    query = from(m in Message, order_by: [desc: m.inserted_at]) 
    messages = Repo.all(query)

    list = add_to_list(messages, [])

    {:ok, list, socket}
  end

  defp add_to_list([head | tail], []) do
    add_to_list(tail, [%{"author" => head.author, "payload" => head.payload}])
  end

  defp add_to_list([head | tail], list) do
   add_to_list(tail, [%{"author" => head.author, "payload" => head.payload} | list])
  end

  defp add_to_list([], list) do
    list
  end

  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"message" => message, "author" => author}, socket) do
    changeset = Message.changeset(%Message{}, %{author: author, payload: message})
    Repo.insert(changeset)

    broadcast! socket, "new_msg", %{payload: message, author: author}
    {:noreply, socket}
  end

  def handle_out("new_msg", payload, socket) do
    push socket, "new_msg", payload
    {:noreply, socket}
  end
end
