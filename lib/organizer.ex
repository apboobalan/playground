defmodule Playground.Organizer do

  use Ecto.Schema
  import Ecto.Changeset

  schema "organizers" do
    field :organization, :string
    many_to_many :user, Playground.User, join_through: "organizer_users"
  end

  def new do
    %__MODULE__{}
  end

  def changeset(organiser, user, params \\ %{}) do
    organiser
    |> cast(params, [:organization])
    |> put_assoc(:user, [user])
  end

end
