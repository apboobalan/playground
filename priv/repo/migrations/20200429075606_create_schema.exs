defmodule Playground.Repo.Migrations.CreateSchema do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
    end

    create table(:organizers) do
      add :organization, :string
    end

    create table(:players) do
      add :stats, :string
    end
    create table(:balls) do
      add :ball, :integer
      add :face_id, references(:players)
      add :bowl_id, references(:players)
    end

    create table(:organizer_users) do
      add :user_id, references(:users)
      add :organizer_id, references(:organizers)
    end

    create table(:player_users) do
      add :user_id, references(:users)
      add :player_id, references(:players)
    end
  end
end
