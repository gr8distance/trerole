defmodule Api.Jwt do
  def decode(token) do
    token |> Joken.peek_claims()
  end

  def decode!(token) do
    {:ok, claims} = token |> decode
    claims
  end
end
