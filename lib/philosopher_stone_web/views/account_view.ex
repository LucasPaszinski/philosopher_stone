defmodule PhilosopherStoneWeb.AccountView do
  use PhilosopherStoneWeb, :view

  alias PhilosopherStone.User.Account

  def render("account.json", %{
        from_account: %Account{} = from_account,
        to_account: %Account{} = to_account
      }) do
    %{
      from_account: %{
        balance: from_account.balance
      },
      to_account: %{
        balance: to_account.balance
      }
    }
  end

  def render("account.json", %{account: %Account{} = account}) do
    %{
      balance: account.balance
    }
  end
end
