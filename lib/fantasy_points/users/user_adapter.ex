defmodule FantasyPoints.Users.UserAdapter do
  @moduledoc """
  This module performs database operations for user module.
  """

  alias FantasyPoints.Repo
  alias FantasyPoints.Users.Changesets.User

  def create(attrs) do
    attrs
    |> User.build()
    |> Repo.insert()
  end
end
