defmodule Vista.Repo.Migrations.CreateChore do
  use Ecto.Migration

  def change do
    create table(:chores) do
      add :description, :text
      add :start_date, :utc_datetime
      add :schedule, :string

      timestamps()
    end

  end
end
