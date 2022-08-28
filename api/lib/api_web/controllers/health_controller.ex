defmodule ApiWeb.HealthController do
  use ApiWeb, :controller
  use OpenApiSpex.ControllerSpecs

  alias ApiWeb.Schemas.{HealthResponse}

  tags ["health"]

  operation :alive,
    summary: "Health ckeck api",
    parameters: [],
    responses: [
      ok: {"health check", "application/json", HealthResponse}
    ]

  def alive(conn, _params) do
    render(conn, "alive.json", %{})
  end
end
