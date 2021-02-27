defmodule PhilosopherStone.User.Create do
  alias PhilosopherStone.Repo
  alias PhilosopherStone.User
  import PhilosopherStone.User.Account.Create, only: [create_account_changeset: 1]
  alias Ecto.Multi

  def create_user_with_account(attrs) do
    Multi.new()
    |> Multi.insert(:user, create_user_changeset(attrs))
    |> Multi.run(:account, &create_account_changeset_for_user/2)
    |> Repo.transaction()
  end

  def create_user(attrs) do
    attrs
    |> create_user_changeset()
    |> Repo.insert()
  end

  def create_user_changeset(attrs) do
    %User{}
    |> User.changeset(attrs)
  end

  defp create_account_changeset_for_user(repo, %{user: %{id: user_id}} = attrs) do
    %{balance: 0, user_id: user_id}
    |> create_account_changeset()
    |> repo.insert()
  end
end
