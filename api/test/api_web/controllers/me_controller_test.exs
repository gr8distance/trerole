defmodule ApiWeb.MeControllerTest do
  use ApiWeb.ConnCase

  alias Api.AccessToken

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
    {:ok, conn: put_req_header(conn, "authorization", "Bearer #{AccessToken.token()}")}
  end

  require IEx

  describe "index" do
    test "/meはheaderの認証情報をもとに該当ユーザーの情報を返す", %{conn: conn} do
      conn = get(conn, Routes.me_path(conn, :index))
      IEx.pry()
      assert false
    end
  end
end
