defmodule CspReportCollector.ReportingTest do
  use CspReportCollector.DataCase

  alias CspReportCollector.Reporting

  describe "csp_reports" do
    alias CspReportCollector.Reporting.CspReport

    @valid_attrs %{
      blocked_uri: "some blocked_uri",
      column_number: 42,
      disposition: "some disposition",
      document_uri: "some document_uri",
      effective_directive: "some effective_directive",
      line_number: 42,
      original_policy: "some original_policy",
      referrer: "some referrer",
      script_sample: "some script_sample",
      source_file: "some source_file",
      status_code: 42,
      violated_directive: "some violated_directive"
    }
    @update_attrs %{
      blocked_uri: "some updated blocked_uri",
      column_number: 43,
      disposition: "some updated disposition",
      document_uri: "some updated document_uri",
      effective_directive: "some updated effective_directive",
      line_number: 43,
      original_policy: "some updated original_policy",
      referrer: "some updated referrer",
      script_sample: "some updated script_sample",
      source_file: "some updated source_file",
      status_code: 43,
      violated_directive: "some updated violated_directive"
    }
    # @invalid_attrs %{blocked_uri: nil, column_number: nil, disposition: nil, document_uri: nil, effective_directive: nil, line_number: nil, original_policy: nil, referrer: nil, script_sample: nil, source_file: nil, status_code: nil, violated_directive: nil}

    def csp_report_fixture(attrs \\ %{}) do
      {:ok, csp_report} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Reporting.create_csp_report()

      csp_report
    end

    test "list_csp_reports/0 returns all csp_reports" do
      csp_report = csp_report_fixture()
      assert Reporting.list_csp_reports() == [csp_report]
    end

    test "get_csp_report!/1 returns the csp_report with given id" do
      csp_report = csp_report_fixture()
      assert Reporting.get_csp_report!(csp_report.id) == csp_report
    end

    test "create_csp_report/1 with valid data creates a csp_report" do
      assert {:ok, %CspReport{} = csp_report} = Reporting.create_csp_report(@valid_attrs)
      assert csp_report.blocked_uri == "some blocked_uri"
      assert csp_report.column_number == 42
      assert csp_report.disposition == "some disposition"
      assert csp_report.document_uri == "some document_uri"
      assert csp_report.effective_directive == "some effective_directive"
      assert csp_report.line_number == 42
      assert csp_report.original_policy == "some original_policy"
      assert csp_report.referrer == "some referrer"
      assert csp_report.script_sample == "some script_sample"
      assert csp_report.source_file == "some source_file"
      assert csp_report.status_code == 42
      assert csp_report.violated_directive == "some violated_directive"
    end

    # test "create_csp_report/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Reporting.create_csp_report(@invalid_attrs)
    # end

    test "update_csp_report/2 with valid data updates the csp_report" do
      csp_report = csp_report_fixture()
      assert {:ok, csp_report} = Reporting.update_csp_report(csp_report, @update_attrs)
      assert %CspReport{} = csp_report
      assert csp_report.blocked_uri == "some updated blocked_uri"
      assert csp_report.column_number == 43
      assert csp_report.disposition == "some updated disposition"
      assert csp_report.document_uri == "some updated document_uri"
      assert csp_report.effective_directive == "some updated effective_directive"
      assert csp_report.line_number == 43
      assert csp_report.original_policy == "some updated original_policy"
      assert csp_report.referrer == "some updated referrer"
      assert csp_report.script_sample == "some updated script_sample"
      assert csp_report.source_file == "some updated source_file"
      assert csp_report.status_code == 43
      assert csp_report.violated_directive == "some updated violated_directive"
    end

    # test "update_csp_report/2 with invalid data returns error changeset" do
    #   csp_report = csp_report_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Reporting.update_csp_report(csp_report, @invalid_attrs)
    #   assert csp_report == Reporting.get_csp_report!(csp_report.id)
    # end

    test "delete_csp_report/1 deletes the csp_report" do
      csp_report = csp_report_fixture()
      assert {:ok, %CspReport{}} = Reporting.delete_csp_report(csp_report)
      assert_raise Ecto.NoResultsError, fn -> Reporting.get_csp_report!(csp_report.id) end
    end

    test "change_csp_report/1 returns a csp_report changeset" do
      csp_report = csp_report_fixture()
      assert %Ecto.Changeset{} = Reporting.change_csp_report(csp_report)
    end
  end
end
