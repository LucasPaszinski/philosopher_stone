defmodule PhilosopherStoneWeb.AccountView do
  use PhilosopherStoneWeb, :view

  alias PhilosopherStone.User.Account

  def render("transfer.json", %{
        from_account: %Account{} = from_account,
        to_account: %Account{} = to_account
      }) do
    %{
      message: "Money transfer with success.",
      from_account: %{
        id: from_account.id,
        balance: from_account.balance
      },
      to_account: %{
        id: to_account.id,
        balance: to_account.balance
      }
    }
  end

  def render("account.json", %{account: %Account{} = account}) do
    %{
      message: "Account balance updated.",
      account: %{
        id: account.id,
        balance: account.balance
      }
    }
  end
end
