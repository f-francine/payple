# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :payple,
  ecto_repos: [Payple.Repo]

# Configures the endpoint
config :payple, PaypleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vlC0eqt2EP5Ojq4Eb8HZ642b9J0nslbXuILg3g9gCWT0CXLMetY61FpLxu4hb41w",
  render_errors: [view: PaypleWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Payple.PubSub,
  live_view: [signing_salt: "bWWsFuxM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
