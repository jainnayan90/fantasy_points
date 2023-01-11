defmodule FantasyPoints.UserInteractorTest do
  use ExUnit.Case
  doctest FantasyPoints.UserInteractor

  alias FantasyPoints.Repo
  alias FantasyPoints.UserInteractor

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Repo, {:shared, self()})
  end

  describe "User interactor - " do
    test "returns user fetched from user server" do
      assert {:ok, {_, _}} = UserInteractor.get_users()
    end
  end
end
