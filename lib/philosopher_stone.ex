defmodule PhilosopherStone do
  @moduledoc """
  PhilosopherStone keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate create_user_with_account(attrs), to: __MODULE__.User.Create
  defdelegate deposit_into(account_id, value), to: __MODULE__.User.Account.Deposit
  defdelegate withdraw_from(account_id, value), to: __MODULE__.User.Account.Withdraw

  defdelegate transfer_value(from_account_id, to_account_id, value),
    to: __MODULE__.User.Account.Transfer
end
