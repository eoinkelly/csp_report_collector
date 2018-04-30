defmodule CspReportCollector.Reporting do
  @moduledoc """
  The Reporting context.
  """

  import Ecto.Query, warn: false
  alias CspReportCollector.Repo

  alias CspReportCollector.Reporting.CspReport

  @doc """
  Returns the list of csp_reports.

  ## Examples

      iex> list_csp_reports()
      [%CspReport{}, ...]

  """
  def list_csp_reports do
    Repo.all(CspReport)
  end

  @doc """
  Returns recent csp_reports.

  ## Examples

      iex> recent_csp_reports()
      [%CspReport{}, ...]

  """
  def recent_csp_reports do
    query =
      from(
        r in CspReportCollector.Reporting.CspReport,
        order_by: [desc: :inserted_at],
        limit: 500
      )

    Repo.all(query)
  end

  @doc """
  Gets a single csp_report.

  Raises `Ecto.NoResultsError` if the Csp report does not exist.

  ## Examples

      iex> get_csp_report!(123)
      %CspReport{}

      iex> get_csp_report!(456)
      ** (Ecto.NoResultsError)

  """
  def get_csp_report!(id), do: Repo.get!(CspReport, id)

  @doc """
  Creates a csp_report.

  ## Examples

      iex> create_csp_report(%{field: value})
      {:ok, %CspReport{}}

      iex> create_csp_report(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_csp_report(attrs \\ %{}) do
    %CspReport{}
    |> CspReport.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a csp_report.

  ## Examples

      iex> update_csp_report(csp_report, %{field: new_value})
      {:ok, %CspReport{}}

      iex> update_csp_report(csp_report, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_csp_report(%CspReport{} = csp_report, attrs) do
    csp_report
    |> CspReport.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CspReport.

  ## Examples

      iex> delete_csp_report(csp_report)
      {:ok, %CspReport{}}

      iex> delete_csp_report(csp_report)
      {:error, %Ecto.Changeset{}}

  """
  def delete_csp_report(%CspReport{} = csp_report) do
    Repo.delete(csp_report)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking csp_report changes.

  ## Examples

      iex> change_csp_report(csp_report)
      %Ecto.Changeset{source: %CspReport{}}

  """
  def change_csp_report(%CspReport{} = csp_report) do
    CspReport.changeset(csp_report, %{})
  end
end
