# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :fantasy_points,
  ecto_repos: [FantasyPoints.Repo]

# Configures the endpoint
config :fantasy_points, FantasyPointsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yoUUjZwH840fqm07XY6XjuSkJK4Djyb7Y1r62irHhpQunWcKplqDXv4+G8n7Rlup",
  render_errors: [view: FantasyPointsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FantasyPoints.PubSub,
  live_view: [signing_salt: "PAcsXrsw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
