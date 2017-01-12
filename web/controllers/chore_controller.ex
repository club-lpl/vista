require IEx

defmodule Vista.ChoreController do
  use Vista.Web, :controller

  def index(conn, _params) do
    chores = Vista.Repo.all(Vista.Chore)
    IEx.pry()
    render(conn, "index.json", chores: chores)
  end

  def create(conn, params) do
    %Vista.Chore{}
    |> Vista.Chore.changeset(params)
    |> Vista.Repo.insert()
    |> handleInsert(conn)
  end

  defp handleInsert({ :ok, chore }, conn) do
    render(conn, "chore.json", chore: chore)
  end
end
