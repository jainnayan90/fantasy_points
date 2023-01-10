defmodule FantasyPoints.Changesets.User do
  @moduledoc """
  Module to implement user changeset.
  """
  import Ecto.Changeset

  alias FantasyPoints.Schemas.User

  @params_required ~w(points)a

  def build(user \\ %User{}, attrs)

  def build(user, %_{} = attrs), do: cast_params(user, Map.from_struct(attrs))


  def build(user, attrs), do: cast_params(user, attrs)

  def cast_params(user, attrs) do
    user
    |> cast(attrs, @params_required)
    |> validate_required(@params_required)
    |> validate_number(:points, greater_than_or_equal_to: 0)
    |> validate_number(:points, less_than_or_equal_to: 100)
  end
end
