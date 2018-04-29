defmodule CspReportCollectorWeb.PageController do
  use CspReportCollectorWeb, :controller
  require Logger
  import Ecto.Query

  def index(conn, _params) do
    query = from(r in CspReportCollector.CspReport)
    reports = CspReportCollector.Repo.all(query)
    Logger.info("#{inspect(reports)}")

    render(conn, "index.html", reports: reports)
  end
end
