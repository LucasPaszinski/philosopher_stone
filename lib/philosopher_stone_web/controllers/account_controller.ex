defmodule PhilosopherStoneWeb.AccountController do
  use PhilosopherStoneWeb, :controller

  action_fallback PhilosopherStoneWeb.FallbackController

  def deposit(conn, %{"id" => account_id, "value" => value}) do
    with {:ok, %{deposit: account}} <- deposit_into(account_id, value) do
      conn
      |> put_status(:created)
      |> render("account.json", account: account)
    else
      {:error, _, changeset, _} -> {:error, changeset}
    end
  end

  def withdraw(conn, %{"id" => account_id, "value" => value}) do
    with {:ok, %{withdraw: account}} <- withdraw_from(account_id, value) do
      conn
      |> put_status(:created)
      |> render("account.json", account: account)
    else
      {:error, _, changeset, _} -> {:error, changeset}
    end
  end

  def transfer(conn, %{
        "from_account_id" => from_account_id,
        "to_account_id" => to_account_id,
        "value" => value
      }) do
    with {:ok, %{withdraw: from_account, deposit: to_account}} <-
           transfer_value(from_account_id, to_account_id, value) do
      conn
      |> put_status(:created)
      |> render("transfer.json", %{from_account: from_account, to_account: to_account})
    else
      {:error, _, changeset, _} -> {:error, changeset}
    end
  end
end
