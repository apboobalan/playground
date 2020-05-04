defmodule Playground.Ball do
  use Ecto.Schema
  import Ecto.Changeset

  alias Playground.Repo

  schema "balls" do
    field :ball, :integer
    belongs_to :face, Playground.Player
    belongs_to :bowl, Playground.Player
  end

  def new do
    %__MODULE__{}
  end

  def changeset(face, bowl, params \\ %{}) do
    {:ok, ball_faced} = face
    |> Ecto.build_assoc(:balls_faced)
    |> cast(params, [:ball])
    |> Repo.insert

    {:ok, ball} = bowl
    |> Ecto.build_assoc(:balls_bowld, ball_faced)
    |> Repo.insert(on_conflict: {:replace, [:bowl_id]}, conflict_target: :id)

    ball
  end

end
