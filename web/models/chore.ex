defmodule Vista.Chore do
  use Vista.Web, :model

  schema "chores" do
    field :description, :string
    field :start_date, Ecto.DateTime
    field :schedule, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :start_date, :schedule])
    |> validate_required([:description, :start_date, :schedule])
  end
end
