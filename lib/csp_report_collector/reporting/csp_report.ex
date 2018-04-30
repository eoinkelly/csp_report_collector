defmodule CspReportCollector.Reporting.CspReport do
  use Ecto.Schema
  import Ecto.Changeset

  schema "csp_reports" do
    field(:blocked_uri, :string)
    field(:column_number, :integer)
    field(:disposition, :string)
    field(:document_uri, :string)
    field(:effective_directive, :string)
    field(:line_number, :integer)
    field(:original_policy, :string)
    field(:referrer, :string)
    field(:script_sample, :string)
    field(:source_file, :string)
    field(:status_code, :integer)
    field(:violated_directive, :string)

    timestamps()
  end

  @doc false
  def changeset(csp_report, attrs) do
    csp_report
    |> Ecto.Changeset.cast(attrs, [
      :blocked_uri,
      :column_number,
      :disposition,
      :document_uri,
      :effective_directive,
      :line_number,
      :original_policy,
      :referrer,
      :script_sample,
      :source_file,
      :status_code,
      :violated_directive
    ])
  end
end
