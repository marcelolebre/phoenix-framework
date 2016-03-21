defmodule UaChat.Happy do
  use UaChat.Web, :model

  schema "happys" do
    field :level, :integer
    belongs_to :user, UaChat.User

    timestamps
  end

  @required_fields ~w(level)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
