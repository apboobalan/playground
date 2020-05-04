defmodule Playground.Player do

  use Ecto.Schema
  import Ecto.Changeset

  schema "players" do
    field :stats, :string
    many_to_many :user, Playground.User, join_through: "player_users"
    has_many :balls_faced, Playground.Ball, foreign_key: :face_id
    has_many :balls_bowld, Playground.Ball, foreign_key: :bowl_id
  end

  def new do
    %__MODULE__{}
  end

  def changeset(player, user, params \\ %{}) do
    player
    |> cast(params, [:stats])
    |> put_assoc(:user, [user])
  end

end
