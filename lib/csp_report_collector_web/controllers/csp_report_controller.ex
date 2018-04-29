defmodule CspReportCollectorWeb.CspReportController do
  use CspReportCollectorWeb, :controller
  require Logger

  def index(conn, params) do
    Logger.warn("Params: #{inspect(params)}")

    report = %CspReportCollector.CspReport{}
    report_changeset = CspReportCollector.CspReport.changeset(report, params["csp-report"])

    case CspReportCollector.Repo.insert(report_changeset) do
      {:ok, report} ->
        json(conn, %{success: true})

      {:error, changeset} ->
        json(conn, %{success: false})
    end
  end
end
