defmodule FantasyPoints.Repo.Migrations.UsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :points, :integer, null: false, default: 0

      timestamps(
        type: :utc_datetime_usec,
        default: fragment("timezone('utc', now())"),
        null: false
      )
    end
  end
end
