require IEx

defmodule Vista.ChoreView do
  use Vista.Web, :view

  def render("index.json", _params) do
    [%{ "foo" => "awesome" }]
  end

  def render("chore.json", chore) do
    IEx.pry()
    Map.take(chore, [:id, :description, :start_date, :schedule, :inserted_at, :updated_at])
  end
end
