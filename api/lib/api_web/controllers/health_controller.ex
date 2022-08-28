defmodule ApiWeb.HealthController do
  use ApiWeb, :controller

  def alive(conn, _params) do
    render(conn, "alive.json", %{})
  end
end
