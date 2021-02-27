defmodule PhilosopherStone.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table :accounts do
      add :user_id, references(:users, type: :binary_id)
      add :balance, :decimal

      timestamps()
    end
    create constraint(:accounts, :balance_greater_then_or_equal_to_zero, check: "balance >= 0")
  end
end
