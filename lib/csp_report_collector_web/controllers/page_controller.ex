defmodule CspReportCollectorWeb.PageController do
  use CspReportCollectorWeb, :controller
  import Ecto.Query

  def index(conn, _params) do
    query = from(r in CspReportCollector.CspReport)
    reports = CspReportCollector.Repo.all(query)
    render(conn, "index.html", reports: reports)
  end
end
