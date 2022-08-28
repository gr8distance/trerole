defmodule ApiWeb.HealthView do
  use ApiWeb, :view

  def render("alive.json", _params) do
    %{health: "alive"}
  end
end
