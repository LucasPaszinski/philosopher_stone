defmodule PhilosopherStone.User.Account.Deposit do
  alias PhilosopherStone.Repo
  import PhilosopherStone.User.Account.Operation, only: [operation: 3]

  def deposit(account_id, value) do
    operation(:deposit, account_id, value)
    |> Repo.transaction()
  end
end
