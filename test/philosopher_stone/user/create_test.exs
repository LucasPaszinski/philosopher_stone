defmodule PhilosopherStone.User.CreateTest do
  alias PhilosopherStone.{Repo, User}
  alias PhilosopherStone.User.Account
  alias PhilosopherStone.User.Create
  use PhilosopherStone.DataCase

  describe "create_user_with_account/1" do
    test "when user get correct params" do
      name = "Macaco"
      age = 24
      nickname = "macaco"
      password = "eu_vim_ver_o_macaco"
      email = "macaco@kaiba_corp.com"

      attrs = %{name: name, age: age, nickname: nickname, password: password, email: email}

      {:ok,
       %{
         user: %User{id: user_id} = user,
         account: %Account{id: account_id} = account
       }} = Create.create_user_with_account(attrs)

      assert %User{
               id: ^user_id,
               name: ^name,
               age: ^age,
               nickname: ^nickname,
               email: ^email
             } = Repo.get!(User, user_id)

      assert %Account{
               id: ^account_id,
               balance: %Decimal{}
             } = Repo.get!(Account, account_id)
    end

    test "when invalid password is given" do
      attrs = %{
        name: "Macaco",
        age: 24,
        nickname: "macaco",
        password: "manky",
        email: "macaco@kaiba_corp.com"
      }

      assert {:error, _, changeset = %{errors: errors}, _} =
               Create.create_user_with_account(attrs)

      assert [
               password:
                 {"should be at least %{count} character(s)",
                  [count: 6, validation: :length, kind: :min, type: :string]}
             ] = errors
    end
  end

  # describe "create_user/1" do
  # end

  # describe "create_user_changeset/1" do
  # end
end
