defmodule UaChat.HappyTest do
  use UaChat.ModelCase

  alias UaChat.Happy

  @valid_attrs %{level: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Happy.changeset(%Happy{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Happy.changeset(%Happy{}, @invalid_attrs)
    refute changeset.valid?
  end
end
