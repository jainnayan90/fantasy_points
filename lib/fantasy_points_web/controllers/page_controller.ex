defmodule FantasyPointsWeb.PageController do
  use FantasyPointsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
