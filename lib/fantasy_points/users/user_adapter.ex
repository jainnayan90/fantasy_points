defmodule FantasyPoints.Users.UserAdapter do
  @moduledoc """
  This module performs database operations for user module.
  """

  import Ecto.Query

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

  def get_users(points) do
    UserSchema
    |> where([u], u.points > ^points)
    |> limit(2)
    |> order_by([u], desc: u.points)
    |> Repo.all()
  end
end
