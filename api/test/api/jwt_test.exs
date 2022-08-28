defmodule Api.JwtTest do
  use ExUnit.Case

  alias Api.Jwt
  alias Api.AccessToken

  @valid_claims %{
    "auth_time" => 1_661_687_483,
    "client_id" => "6jtdiqik96uovr53nge0tdi29a",
    "event_id" => "d398c9cf-686c-4f3f-b11b-3afa8b1f90ec",
    "exp" => 1_661_691_083,
    "iat" => 1_661_687_483,
    "iss" => "https://cognito-idp.ap-northeast-1.amazonaws.com/ap-northeast-1_fWzTT82mu",
    "jti" => "4e329436-dcf3-4c81-9512-6e90a1f3bbc9",
    "origin_jti" => "08cf7963-c294-4372-a7a0-2cc0a63e0b5d",
    "scope" => "phone openid email",
    "sub" => "6a39bac6-83bf-44ae-9a62-e6f2e58e3b36",
    "token_use" => "access",
    "username" => "6a39bac6-83bf-44ae-9a62-e6f2e58e3b36",
    "version" => 2
  }

  test ".tokenはJWTをデコードしclaimsを返す" do
    assert {:ok, @valid_claims} == AccessToken.token() |> Jwt.decode()
  end

  test ".token!はJWTをデコードしclaimsを返す" do
    assert @valid_claims == AccessToken.token() |> Jwt.decode!()
  end
end
