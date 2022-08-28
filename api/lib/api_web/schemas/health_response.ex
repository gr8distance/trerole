defmodule ApiWeb.Schemas.HealthResponse do
  alias OpenApiSpex.Schema

  require OpenApiSpex

  OpenApiSpex.schema(%{
    title: "HealthCheckResponse",
    description: "health check用レスポンス",
    type: :object,
    properties: %{
      health: %Schema{type: :string, description: "only allow alive"}
    },
    example: %{health: "alive"}
  })
end
