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

  describe "update/1 - " do
    test "updates user record if points are valid." do
      attrs = %{points: 0}
      assert {:ok, %User{id: id}} = UserAdapter.create(attrs)

      assert %User{id: ^id} = user = UserAdapter.get(id)
      attrs = %{points: 80}

      assert {:ok, %User{points: 80}} = UserAdapter.update(user, attrs)
    end

    test "returns error if points are invalid." do
      attrs = %{points: 0}
      assert {:ok, %User{id: id}} = UserAdapter.create(attrs)

      assert %User{id: ^id} = user = UserAdapter.get(id)
      attrs = %{points: 130}

      assert {:error, %Ecto.Changeset{}} = UserAdapter.update(user, attrs)

      attrs = %{points: -100}

      assert {:error, %Ecto.Changeset{}} = UserAdapter.update(user, attrs)
    end
  end
end
