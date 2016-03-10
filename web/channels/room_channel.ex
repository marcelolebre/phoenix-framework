defmodule UaChat.RoomChannel do
  use Phoenix.Channel
  alias UaChat.Message
  alias UaChat.Repo
  require Logger
  import Ecto.Query

  def join(room, _message, socket) do
    case room do
      "rooms:lobby" ->
        query = from(m in Message, order_by: [desc: m.inserted_at])
        messages = Repo.all(query)

        list = add_to_list(messages, [])
        {:ok, list, socket}
      _ ->
        {:error, %{reason: "unauthorized"}}
    end
  end

  defp add_to_list(messages, message_list) do
    case messages do
      [head | tail] ->
        add_to_list(tail, [%{"author" => head.author, "payload" => head.payload} | message_list])
      [] ->
        message_list
    end
  end

  def handle_in("new_msg", %{"message" => message, "author" => author}, socket) do
    changeset = Message.changeset(%Message{}, %{author: author, payload: message})
    Repo.insert(changeset)

    broadcast! socket, "new_msg", %{payload: message, author: author}
    {:noreply, socket}
  end
end
