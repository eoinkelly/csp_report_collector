defmodule CspReportCollectorWeb.Plugs.TransformMimeType do
  @moduledoc """
  If the HTTP Content-Type header is 'application/csp-report' then this Plug
  will rewrite it to 'application/json'
  """

  def init(default), do: default

  def call(conn, _options) do
    original_content_type_header =
      conn
      |> Plug.Conn.get_req_header("content-type")
      |> List.first()

    if original_content_type_header == "application/csp-report" do
      Plug.Conn.put_req_header(conn, "content-type", "application/json")
    else
      conn
    end
  end
end
