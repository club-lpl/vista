require Ecto

defmodule Vista.ChoreController do
  use Vista.Web, :controller
  alias Vista.{Chore,Repo}

  def index(conn, _params) do
    chores = Repo.all(Chore)
    render(conn, "index.json", chores: chores)
  end

  def show(conn, %{ "id" => id }) do
    chore = Repo.get!(Chore, id)
    render(conn, "chore.json", chore: chore)
  rescue
    Ecto.NoResultsError ->
      not_found(conn)
  end

  def create(conn, params) do
    %Chore{}
    |> Chore.changeset(params)
    |> Repo.insert()
    |> handleInsert(conn)
  end

  def delete(conn, %{ "id" => id }) do
    Repo.get!(Chore, id)
    |> Repo.delete
    |> (fn
          ({ :ok, chore }) -> render(conn, "chore.json", chore: chore)
          ({ :error, _changeset }) -> not_found(conn)
        end).()
  rescue
    Ecto.NoResultsError -> not_found(conn)
  end

  defp handleInsert({ :ok, chore }, conn) do
    render(conn, "chore.json", chore: chore)
  end

  defp handleInsert({ :error, changeset}, conn) do
    render(conn, %{ changeset: changeset })
  end

  defp handleDelete({ :ok, chore }), do: render(conn, "chore.json", chore: chore)
  defp handleDelete({ :error, _changeset }), do: not_found(conn)

  defp not_found(conn) do
    conn
    |> put_status(404)
    |> render("not_found.json", %{})
  end
end
