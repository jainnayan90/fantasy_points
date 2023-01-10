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
      attrs = %{points: 0}
      assert {:ok, %User{points: 0, id: _id}} = UserAdapter.create(attrs)
    end

    test "returns error when attrs are invalid." do
      attrs = %{points: 900}
      assert {:error, %Ecto.Changeset{errors: errors}} = UserAdapter.create(attrs)
      assert errors != []
    end
  end

  describe "get/1 - " do
    test "retrives a user record if user is valid." do
      attrs = %{points: 0}
      assert {:ok, %User{id: id}} = UserAdapter.create(attrs)
      assert %User{id: ^id} = UserAdapter.get(id)
    end

    test "returns error if user is invalid." do
      assert is_nil(UserAdapter.get(987_897_987))
    end
  end

  describe "update/1 - " do
    test "updates user record if points are valid." do
      attrs = %{points: 0}
      assert {:ok, %User{id: id}} = UserAdapter.create(attrs)

      assert %User{id: ^id} = user = UserAdapter.get(id)
      attrs = %{points: 20}

      assert {:ok, %User{points: 20}} = UserAdapter.update(user, attrs)
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

  describe "get_users/1 - " do
    setup do
      attrs1 = %{points: 75}
      assert {:ok, %User{id: id1}} = UserAdapter.create(attrs1)

      attrs2 = %{points: 80}
      assert {:ok, %User{id: id2}} = UserAdapter.create(attrs2)

      attrs3 = %{points: 85}
      assert {:ok, %User{id: id3}} = UserAdapter.create(attrs3)

      %{id1: id1, id2: id2, id3: id3}
    end

    test "retrives no user records if user is valid." do
      assert [] == UserAdapter.get_users(90)
    end

    test "retrives one user records if only one user exists." do
      [user] = UserAdapter.get_users(83)
      assert user.points == 85
    end

    test "retrives two user records if only two user exists." do
      [user1, user2] = UserAdapter.get_users(78)
      assert user1.points == 85
      assert user2.points == 80
    end

    test "retrives two user records if more than two user exists." do
      [user1, user2] = UserAdapter.get_users(70)
      assert user1.points == 85
      assert user2.points == 80
    end
  end
end
