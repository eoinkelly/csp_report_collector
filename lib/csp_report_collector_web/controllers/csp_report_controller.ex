defmodule CspReportCollectorWeb.CspReportController do
  use CspReportCollectorWeb, :controller

  alias CspReportCollector.Reporting

  def index(conn, params) do
    case Reporting.create_csp_report(with_underscored_keys(params["csp-report"])) do
      {:ok, _report} ->
        json(conn, %{success: true})

      {:error, _changeset} ->
        json(conn, %{success: false})
    end
  end

  defp with_underscored_keys(attrs) do
    attrs
    |> Enum.map(fn {k, v} -> {String.replace(k, ~r/-/, "_", global: true), v} end)
    |> Map.new()
  end
end
