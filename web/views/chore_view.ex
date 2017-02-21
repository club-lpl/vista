require IEx

defmodule Vista.ChoreView do
  use Vista.Web, :view

  def render("index.json", %{ chores: chores }) do
    render_many(chores, __MODULE__, "chore.json")
  end

  def render("chore.json", %{ chore: chore }) do
    Map.take(chore, [:id, :description, :start_date, :schedule, :inserted_at, :updated_at])
  end

  def render("not_found.json", _) do
    %{
      error: "Requested Resource Not Found Bro"
    }
  end
end
