# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FantasyPoints.Repo.insert!(%FantasyPoints.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias FantasyPoints.Users.UserAdapter

stream =
  Task.async_stream(1..1_000_000, fn _ ->
    attrs = %{points: 0}
    UserAdapter.create(attrs)
  end)

Stream.run(stream)
