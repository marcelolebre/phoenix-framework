ExUnit.start

Mix.Task.run "ecto.create", ~w(-r UaChat.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r UaChat.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(UaChat.Repo)

