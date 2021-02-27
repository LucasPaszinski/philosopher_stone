defmodule PhilosopherStone.User.Account.Operation do
  alias Ecto.Multi
  alias PhilosopherStone.User.Account

  def operation(operation, account_id, value) do
    operation_account = make_operation_atom(operation, "account")

    Multi.new()
    |> Multi.run(operation_account, &get_account(&1, &2, account_id))
    |> Multi.run(operation, &update_account(&1, &2, operation_account, value, operation))
  end

  defp get_account(repo, _params, account_id) do
    case repo.get(Account, account_id) do
      nil -> {:error, :not_found}
      otherwise -> {:ok, otherwise}
    end
  end

  defp update_account(repo, params, operation_account, value, operation) do
    %Account{balance: balance} = account = params |> Map.get(operation_account)

    updated_balance = make_operation(operation, balance, value)

    account
    |> Account.changeset(%{balance: updated_balance})
    |> repo.update()
  end

  defp make_operation(:deposit, balance, value) do
    Decimal.add(balance, value)
  end

  defp make_operation(:withdraw, balance, value) do
    Decimal.sub(balance, value)
  end

  defp make_operation_atom(atom, text) do
    atom
    |> Atom.to_string()
    |> Kernel.<>(text)
    |> String.to_atom()
  end
end
