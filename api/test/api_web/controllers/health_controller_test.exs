defmodule ApiWeb.HealthControllerTest do
  use ApiWeb.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "health/aliveは適切なレスポンスを返す", %{conn: conn} do
      conn = get(conn, Routes.health_path(conn, :alive))
      {:ok, json} = Jason.decode(conn.resp_body)
      assert json["health"] == "alive"
    end
  end
end
