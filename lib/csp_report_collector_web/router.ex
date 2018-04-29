defmodule CspReportCollectorWeb.Router do
  use CspReportCollectorWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", CspReportCollectorWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api", CspReportCollectorWeb do
    pipe_through(:api)
    post("/csp-report", CspReportController, :index)
  end
end
