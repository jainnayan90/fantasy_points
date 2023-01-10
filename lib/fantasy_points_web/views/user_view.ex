defmodule FantasyPointsWeb.UserView do
  @moduledoc """
  This module creates and returns the user data response.
  """
  use FantasyPointsWeb, :view

  def render("index.json", %{timestamp: timestamp, users: users}),
    do: %{
      timestamp: timestamp,
      users: make_users_response(users)
    }

  defp make_users_response(users, res \\ [])
  defp make_users_response([], res), do: res

  defp make_users_response([user | rest], res),
    do: make_users_response(rest, res ++ [%{id: user.id, points: user.points}])
end
