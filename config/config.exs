# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :alMandado,
  ecto_repos: [AlMandado.Repo]

# Configures the endpoint
config :alMandado, AlMandadoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "byoMGQ+8MAmPVHZDa954NvJxnxZaymkgt5GTSvScpGKHtrFyKs3IvzM4ySmKUbR6",
  render_errors: [view: AlMandadoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AlMandado.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
