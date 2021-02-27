defmodule PhilosopherStoneWeb.UserView do
  use PhilosopherStoneWeb, :view

  alias PhilosopherStone.User
  alias PhilosopherStone.User.Account

  def render("user.json", %{user: %User{} = user, account: %Account{} = account}) do
    %{
      message: "User created successfully.",
      user: %{
        id: user.id,
        name: user.name,
        age: user.age,
        email: user.email,
        nickname: user.nickname,
        account: %{
          id: account.id,
          balance: account.balance
        }
      }
    }
  end
end
