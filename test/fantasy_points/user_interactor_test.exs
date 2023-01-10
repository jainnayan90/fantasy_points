defmodule FantasyPoints.UserInteractorTest do
  use ExUnit.Case
  doctest FantasyPoints.UserInteractor

  import Mox

  alias FantasyPoints.UserInteractor
  alias FantasyPoints.Users.UserAdapter

  @user_adapter_response
  [
    %FantasyPoints.Users.Schemas.User{
      id: 158,
      points: 85,
      inserted_at: ~U[2023-01-10 17:39:43.396774Z],
      updated_at: ~U[2023-01-10 17:39:43.396774Z]
    },
    %FantasyPoints.Users.Schemas.User{
      id: 157,
      points: 80,
      inserted_at: ~U[2023-01-10 17:39:43.396422Z],
      updated_at: ~U[2023-01-10 17:39:43.396422Z]
    }
  ]

  describe "User interactor - " do
    test "returns user fetched from user server" do
      expect(UserAdapter, :get_users, fn _ -> @user_adapter_response end)

      assert {:ok, {_, _}} = UserInteractor.get_users()
    end
  end
end
