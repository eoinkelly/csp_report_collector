defmodule CspReportCollectorWeb.CspReportController do
  use CspReportCollectorWeb, :controller

  alias CspReportCollector.Reporting

  def index(conn, params) do
    {:ok} = Reporting.create_csp_report_async(with_underscored_keys(params["csp-report"]))
    json(conn, %{report_accepted: true})
  end

  defp with_underscored_keys(attrs) do
    attrs
    |> Enum.map(fn {k, v} -> {String.replace(k, ~r/-/, "_", global: true), v} end)
    |> Map.new()
  end
end
