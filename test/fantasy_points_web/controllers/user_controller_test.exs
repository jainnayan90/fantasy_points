defmodule FantasyPointsWeb.UserControllerTest do
  use FantasyPointsWeb.ConnCase
  doctest FantasyPoints.UserInteractor

  describe "User Controller - " do
    test "GET /", %{conn: conn} do
      conn = get(conn, "/")
      assert conn.status == 200
      assert {:ok, %{"timestamp" => _, "users" => _}} = Jason.decode(conn.resp_body)
    end
  end
end
