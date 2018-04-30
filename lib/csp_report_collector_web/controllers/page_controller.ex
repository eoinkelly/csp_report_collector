defmodule CspReportCollectorWeb.PageController do
  use CspReportCollectorWeb, :controller

  alias CspReportCollector.Reporting

  def index(conn, _params) do
    render(conn, "index.html", reports: Reporting.recent_csp_reports())
  end
end
