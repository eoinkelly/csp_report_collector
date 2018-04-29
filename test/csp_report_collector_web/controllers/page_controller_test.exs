defmodule CspReportCollectorWeb.PageControllerTest do
  use CspReportCollectorWeb.ConnCase

  @username System.get_env("BASIC_AUTH_USERNAME")
  @password System.get_env("BASIC_AUTH_PASSWORD")

  test "GET / without basic auth credentials prevents access", %{conn: conn} do
    conn = conn |> get("/")

    assert response(conn, 401) =~ "401 Unauthorized"
  end

  test "GET / with basic auth credential shows the homepage", %{conn: conn} do
    conn =
      conn
      |> using_basic_auth(@username, @password)
      |> get("/")

    assert html_response(conn, 200) =~ "CSP Report"
  end

  defp using_basic_auth(conn, username, password) do
    header_content = "Basic " <> Base.encode64("#{username}:#{password}")
    conn |> put_req_header("authorization", header_content)
  end
end
