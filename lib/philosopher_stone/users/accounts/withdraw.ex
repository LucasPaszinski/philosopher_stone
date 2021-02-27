defmodule PhilosopherStone.User.Account.Withdraw do
  alias PhilosopherStone.Repo
  import PhilosopherStone.User.Account.Operation, only: [operation: 3]

  def withdraw(account_id, value) do
    operation(:withdraw, account_id, value)
    |> Repo.transaction()
  end
end
