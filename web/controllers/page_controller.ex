defmodule Vista.PageController do
  use Vista.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", %{"id" => id})
  end
end
