# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :csp_report_collector, ecto_repos: [CspReportCollector.Repo]

# Configures the endpoint
config :csp_report_collector, CspReportCollectorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Dk0HcGhEivgrT3TAIWv9nrUGZZgeFfvsBzfZMhMqbKigPxzqgztduq4IP3HbLX6b",
  render_errors: [view: CspReportCollectorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CspReportCollector.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :csp_report_collector,
  my_auth_with_system: [
    username: {:system, "BASIC_AUTH_USERNAME"},
    password: {:system, "BASIC_AUTH_PASSWORD"},
    realm: {:system, "BASIC_AUTH_REALM"}
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
