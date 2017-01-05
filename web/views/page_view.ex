defmodule Vista.PageView do
  use Vista.Web, :view

  def render("show.json", params) do
    %{id: Map.get(params, "id")}
  end
end
