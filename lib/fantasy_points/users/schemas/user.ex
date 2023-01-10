defmodule FantasyPoints.Users.Schemas.User do
  @moduledoc """
  This module creates database schema structure for users.
  """
  use Ecto.Schema

  schema "users" do
    field :points, :integer
    timestamps(type: :utc_datetime_usec)
  end
end
