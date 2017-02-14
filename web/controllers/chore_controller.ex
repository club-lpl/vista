require IEx

defmodule Vista.ChoreController do
  use Vista.Web, :controller
  alias Vista.{Chore,Repo}

  def index(conn, _params) do
    chores = Repo.all(Chore)
    IEx.pry()
    render(conn, "index.json", chores: chores)
  end

  def show(conn, %{ "id" => id }) do
    chore = Repo.get(Chore, id)
    render(conn, "chore.json", chore: chore)
  end

  def create(conn, params) do
    %Chore{}
    |> Chore.changeset(params)
    |> Repo.insert()
    |> handleInsert(conn)
  end

  def delete(conn, %{ "id" => id }) do
    chore = Repo.get!(Chore, id)
    case Repo.delete(chore) do
      {:ok, struct}       -> # Deleted with success
      {:error, changeset} -> # Something went wrong
    end
  end

  defp handleInsert({ :ok, chore }, conn) do
    render(conn, "chore.json", chore: chore)
  end

  defp handleDelete({ :ok, struct }, conn) do

  end
end
