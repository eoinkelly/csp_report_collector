defmodule CspReportCollector.CspReport do
  use Ecto.Schema

  schema "csp_reports" do
    field(:blocked_uri, :string)
    field(:disposition, :string)
    field(:document_uri, :string)
    field(:effective_directive, :string)
    field(:line_number, :integer)
    field(:column_number, :integer)
    field(:original_policy, :string)
    field(:referrer, :string)
    field(:script_sample, :string)
    field(:source_file, :string)
    field(:status_code, :integer)
    field(:violated_directive, :string)

    timestamps()
  end

  def changeset(csp_report, params \\ %{}) do
    csp_report
    |> Ecto.Changeset.cast(with_underscored_keys(params), [
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

  defp with_underscored_keys(params) do
    params
    |> Enum.map(fn {k, v} -> {String.replace(k, ~r/-/, "_", global: true), v} end)
    |> Map.new()
  end
end
