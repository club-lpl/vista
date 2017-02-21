defmodule Vista.Repo.Migrations.AddSomeUniqueFieldToSomethingCoolILoveRubyNamesTheyAreTheBest do
  use Ecto.Migration

  def change do
    create index(:chores, [:description], unique: true)
  end
end
