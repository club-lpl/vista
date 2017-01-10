defmodule Vista.ChoreController do
  use Vista.Web, :controller

  def index(conn, _params) do
    render conn, "index.json"
  end

  def create(conn, params) do
    %Vista.Chore{}
    |> Vista.Chore.changeset(params)
    |> Vista.Repo.insert()
    |> handleInsert(conn)
  end

  defp handleInsert({ :ok, chore }, conn) do
    render conn, "chore.json", chore
  end
end
