defmodule FantasyPoints.Users.UserServerTest do
  use ExUnit.Case
  doctest FantasyPoints.Users.UserServer

  describe "User server - " do
    test "checks user server process has started" do
      is_alive =
        FantasyPoints.Users.UserServer
        |> Process.whereis()
        |> Process.alive?()

      assert true = is_alive
    end
  end
end
