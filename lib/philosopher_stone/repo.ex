defmodule PhilosopherStone.Repo do
  use Ecto.Repo,
    otp_app: :philosopher_stone,
    adapter: Ecto.Adapters.Postgres
end
