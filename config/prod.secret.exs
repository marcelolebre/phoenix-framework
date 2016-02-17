use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :ua_chat, UaChat.Endpoint,
  secret_key_base: "pNqpbSuMVb6hRoDttlOGDZTYG13a2W4nEAkp2oG+YagLQlXwsLKKWqRQwk8T9RSk"

# Configure your database
config :ua_chat, UaChat.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ua_chat_prod",
  pool_size: 20
