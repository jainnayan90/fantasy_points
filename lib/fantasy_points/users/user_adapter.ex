defmodule FantasyPoints.Users.UserAdapter do
  @moduledoc """
  This module performs database operations for user module.
  """

  alias FantasyPoints.Repo
  alias FantasyPoints.Users.Changesets.User
  alias FantasyPoints.Users.Schemas.User, as: UserSchema

  def create(attrs) do
    attrs
    |> User.build()
    |> Repo.insert()
  end

  def update(user, attrs) do
    user
    |> User.build(attrs)
    |> Repo.update()
  end

  def get(id), do: Repo.get(UserSchema, id, prefix: "public")
end
