defmodule FantasyPoints.Repo do
  use Ecto.Repo,
    otp_app: :fantasy_points,
    adapter: Ecto.Adapters.Postgres
end
