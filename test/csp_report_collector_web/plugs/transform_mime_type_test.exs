defmodule CspReportCollectorWeb.TransformMimeTypeTest do
  use CspReportCollectorWeb.ConnCase

  test "it transforms the 'application/csp-report' Content-Type HTTP Header to 'application/json'",
       %{conn: conn} do
    conn = set_content_type(conn, "application/csp-report")

    conn = conn |> CspReportCollectorWeb.Plugs.TransformMimeType.call(%{})

    assert get_content_type(conn) === "application/json"
  end

  test "it does not transform other Content-Type HTTP Header values", %{conn: conn} do
    conn = set_content_type(conn, "text/html")

    conn = conn |> CspReportCollectorWeb.Plugs.TransformMimeType.call(%{})

    assert get_content_type(conn) === "text/html"
  end

  defp set_content_type(conn, value) do
    conn |> Plug.Conn.put_req_header("content-type", value)
  end

  defp get_content_type(conn) do
    conn |> Plug.Conn.get_req_header("content-type") |> List.first()
  end
end
