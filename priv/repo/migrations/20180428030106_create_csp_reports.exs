defmodule CspReportCollector.Repo.Migrations.CreateCspReports do
  use Ecto.Migration

  def change do
    create table(:csp_reports) do
      add(:blocked_uri, :string)
      add(:column_number, :integer)
      add(:disposition, :string)
      add(:document_uri, :string)
      add(:effective_directive, :string)
      add(:line_number, :integer)
      add(:original_policy, :string)
      add(:referrer, :string)
      add(:script_sample, :string)
      add(:source_file, :string)
      add(:status_code, :integer)
      add(:violated_directive, :string)

      timestamps()
    end
  end
end
