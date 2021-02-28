# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :philosopher_stone,
  ecto_repos: [PhilosopherStone.Repo],
  generators: [binary_id: true]

config :philosopher_stone, PhilosopherStone.Repo, migration_primary_key: [type: :binary_id]

config :philosopher_stone, :basic_auth,
  username: System.get_env("BASIC_AUTH_USERNAME"),
  password: System.get_env("BASIC_AUTH_PASSWORD")

# Configures the endpoint
config :philosopher_stone, PhilosopherStoneWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TtaKq2dNvCwCDKq3yG3vhPlRL4kDx4NC4g9T16wWjtjJ3HoKtA2V2qCgIjH7p1wT",
  render_errors: [view: PhilosopherStoneWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PhilosopherStone.PubSub,
  live_view: [signing_salt: "yFBUY6rN"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
