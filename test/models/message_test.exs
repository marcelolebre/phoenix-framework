defmodule UaChat.MessageTest do
  use UaChat.ModelCase

  alias UaChat.Message

  @valid_attrs %{author: "some content", payload: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Message.changeset(%Message{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Message.changeset(%Message{}, @invalid_attrs)
    refute changeset.valid?
  end
end
