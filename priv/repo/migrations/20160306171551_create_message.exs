defmodule UaChat.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :author, :string
      add :payload, :string

      timestamps
    end

  end
end
