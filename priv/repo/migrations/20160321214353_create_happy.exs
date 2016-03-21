defmodule UaChat.Repo.Migrations.CreateHappy do
  use Ecto.Migration

  def change do
    create table(:happys) do
      add :level, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :message, :string

      timestamps
    end
    create index(:happys, [:user_id])

  end
end
