defmodule CspReportCollectorWeb.CspReportView do
  use CspReportCollectorWeb, :view

  def render("index.json", %{status: success_flag}) do
    %{success: success_flag}
  end
end
