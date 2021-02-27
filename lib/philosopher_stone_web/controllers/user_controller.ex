defmodule PhilosopherStoneWeb.UserController do
  use PhilosopherStoneWeb, :controller

  action_fallback PhilosopherStoneWeb.FallbackController

  def create(conn, params) do
    with {:ok, user_and_account} <- create_user(params) do
      conn
      |> put_status(:created)
      |> render("user.json", user_and_account)
    else
      {:error, _, changeset, _} -> {:error, changeset}
    end
  end
end
