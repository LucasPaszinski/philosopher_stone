defmodule PhilosopherStone do
  @moduledoc """
  PhilosopherStone keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias PhilosopherStone.User
  alias PhilosopherStone.User.Account

  defdelegate create_user(attrs), to: User.Create, as: :create_user_with_account
  defdelegate deposit_into(account_id, value), to: Account.Deposit, as: :deposit
  defdelegate withdraw_from(account_id, value), to: Account.Withdraw, as: :withdraw
  defdelegate transfer_value(from_account_id, to_account_id, value), to: Account.Transfer
end
