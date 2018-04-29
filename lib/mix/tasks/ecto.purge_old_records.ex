defmodule Mix.Tasks.Ecto.PurgeOldRecords do
  use Mix.Task
  import Mix.Ecto

  # 'mix help' shows @shortdoc
  @shortdoc "Trims the csp_reports table"

  @moduledoc """
    Trims the 'csp_reports' table
  """

  def run(args) do
    Mix.shell().info("=== Trimming the csp_reports table ===")

    ensure_started(CspReportCollector.Repo, [])
    num_rows_to_keep = String.to_integer(System.get_env("MAX_NUM_REPORTS_TO_KEEP") || "10000")

    sql = """
    DELETE FROM csp_reports
      WHERE id NOT IN (
        SELECT id FROM csp_reports LIMIT #{num_rows_to_keep})
    """

    Ecto.Adapters.SQL.query(CspReportCollector.Repo, sql)
  end
end
