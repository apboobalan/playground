defmodule Playground.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    many_to_many :organizer, Playground.Organizer, join_through: "organizer_users"
    many_to_many :player, Playground.Player, join_through: "player_users"
  end

  def new do
    %__MODULE__{}
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name])
    |> validate_required([:name])
  end

end
