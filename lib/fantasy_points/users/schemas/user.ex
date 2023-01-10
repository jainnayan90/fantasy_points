defmodule FantasyPoints.Users.Schemas.User do
  use Ecto.Schema

  schema "users" do
    field :points, :integer
    timestamps(type: :utc_datetime_usec)
  end
end
