defmodule CspReportCollectorWeb.PageControllerTest do
  use CspReportCollectorWeb.ConnCase

  test "Attempting to GET / requires HTTP Basic Auth", %{conn: conn} do
    conn = get(conn, "/")

    assert List.first(Plug.Conn.get_resp_header(conn, "www-authenticate")) =~ ~r{Basic realm}
    assert conn.status === 401
    assert conn.resp_body === "401 Unauthorized"
  end
end
