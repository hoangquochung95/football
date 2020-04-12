# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :football,
  ecto_repos: [Football.Repo]

# Configures the endpoint
config :football, FootballWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pULAm5O/ltym05IvjTC1/A4opK8ol7ru0eDo6HVe5YVYo+pThgB4Oa0Fy89Ze3xr",
  render_errors: [view: FootballWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Football.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
