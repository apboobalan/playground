alias Playground.{User, Player, Organizer, Ball, Repo}
import Ecto.Query

# user = User.new |> User.changeset(%{name: "Rocket"})
# Repo.insert(user)
# user = User.new |> User.changeset(%{name: "Sreeni"})
# Repo.insert(user)

# user = User |> where(name: "Rocket") |> limit(1) |> Repo.one()
# organizer = Organizer.new |> Organizer.changeset(user, %{organization: "CCL"})
# Repo.insert(organizer)
# player_one = Player.new |> Player.changeset(user, %{stats: "Right Hand"})
# Repo.insert(player_one)

# user = User |> where(name: "Sreeni") |> limit(1) |> Repo.one()
# player_two = Player.new |> Player.changeset(user, %{stats: "Left Hand"})
# Repo.insert(player_two)

# Player |> Repo.all |> Repo.preload(:user)
# User |> Repo.all |> Repo.preload(:organizer)
# User |> Repo.all |> Repo.preload(:player)
# User |> Repo.all |> Repo.preload(:organizer) |> Repo.preload(:player)

player_one = Player |> where(stats: "Right Hand") |> limit(1) |> Repo.one
player_two = Player |> where(stats: "Left Hand") |> limit(1) |> Repo.one

ball = Ball.changeset(player_one, player_two, %{ball: 1})

ball = Ball |> where(id: ^ball.id) |> preload([{:bowl, :user}]) |> preload([{:face, :user}]) |> Repo.one

IO.inspect("Ball: #{ball.id}, Faced_by: #{(ball.face.user |> List.first).name}, Bowld_by: #{(ball.bowl.user |> List.first).name}")

IO.inspect(Player |> where(id: ^player_two.id) |> preload(:user) |>preload(:balls_bowld) |> Repo.one)


