defmodule PhilosopherStone.User.Account.Create do
  alias PhilosopherStone.User.Account
  alias PhilosopherStone.Repo

  def create_account(attrs) do
    attrs
    |> create_account_changeset()
    |> Repo.insert()
  end

  def create_account_changeset(attrs) do
    %Account{}
    |> Account.changeset(attrs)
  end
end
