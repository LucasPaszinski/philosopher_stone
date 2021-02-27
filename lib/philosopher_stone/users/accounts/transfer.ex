defmodule PhilosopherStone.User.Account.Transfer do
  alias PhilosopherStone.Repo
  alias Ecto.Multi
  import PhilosopherStone.User.Account.Operation, only: [operation: 3]

  def transfer_value(from_account_id, to_account_id, value) do
    Multi.new()
    |> Multi.merge(fn _ -> operation(:withdraw, from_account_id, value) end)
    |> Multi.merge(fn _ -> operation(:deposit, to_account_id, value) end)
    |> Repo.transaction()
  end
end
