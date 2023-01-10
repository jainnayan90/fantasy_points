defmodule FantasyPointsWeb.UserController do
  use FantasyPointsWeb, :controller

  alias FantasyPoints.UserInteractor

  def index(conn, _params) do
    case UserInteractor.get_users() do
      {:ok, {timestamp, users}} ->
        render(conn, "index.json", timestamp: timestamp, users: users)

      _ ->
        conn
        |> put_status(503)
        |> json(%{errors: "Some error occured. Please try again later."})
    end
  end
end
