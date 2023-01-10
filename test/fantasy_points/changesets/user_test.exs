defmodule FantasyPoints.Changesets.UserTest do
  use ExUnit.Case
  doctest FantasyPoints.Changesets.User

  alias FantasyPoints.Changesets.User, as: UserChangeset
  alias FantasyPoints.Schemas.User

  describe "build/2 - " do

    test "creates a valid changeset when only required params are provided." do
      attrs = %{points: 20}
      assert %Ecto.Changeset{changes: %{points: 20}, errors: []} = UserChangeset.build(attrs)
    end

    test "returns error when points are less than 0 or greater than 100." do
      attrs = %{points: 121}
      assert %Ecto.Changeset{changes: %{points: 121}, errors: errors} = UserChangeset.build(attrs)
      assert errors != []

      attrs = %{points: -20}
      assert %Ecto.Changeset{changes: %{points: -20}, errors: errors} = UserChangeset.build(attrs)
      assert errors != []
    end
  end
end
