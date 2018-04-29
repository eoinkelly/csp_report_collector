defmodule CspReportCollectorWeb.CspReportController do
  use CspReportCollectorWeb, :controller

  def index(conn, params) do
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
