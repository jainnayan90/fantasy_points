defmodule FantasyPoints.Users.UserAdapterTest do
  use ExUnit.Case
  doctest FantasyPoints.Users.UserAdapter

  alias FantasyPoints.Repo
  alias FantasyPoints.Users.Schemas.User
  alias FantasyPoints.Users.UserAdapter

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
  end

  describe "create/1 - " do
    test "inserts a new user in database if valid attrs are provided." do
      attrs = %{points: 80}
      assert {:ok, %User{}} = UserAdapter.create(attrs)
    end

    test "returns error when attrs are invalid." do
      attrs = %{points: 900}
      assert {:error, %Ecto.Changeset{errors: errors}} = UserAdapter.create(attrs)
      assert errors != []
    end
  end
end
