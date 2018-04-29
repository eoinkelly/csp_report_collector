defmodule CspReportCollectorWeb.CspReportController do
  use CspReportCollectorWeb, :controller
  require Logger

  def index(conn, params) do
    Logger.warn("Params: #{inspect(params)}")

    report = %CspReportCollector.CspReport{}
    report_changeset = CspReportCollector.CspReport.changeset(report, params["csp-report"])

    case CspReportCollector.Repo.insert(report_changeset) do
      {:ok, report} ->
        Logger.info("Successful save: #{inspect(report)}")
        render(conn, "index.json", %{status: true})

      {:error, changeset} ->
        Logger.error("Failed to save: #{inspect(changeset)}")
        render(conn, "index.json", %{status: false})
    end
  end
end
