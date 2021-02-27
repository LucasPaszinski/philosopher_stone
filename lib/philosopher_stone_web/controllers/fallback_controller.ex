defmodule PhilosopherStoneWeb.FallbackController do
  use PhilosopherStoneWeb, :controller
  alias PhilosopherStoneWeb.ErrorView

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(422)
    |> put_view(ErrorView)
    |> render("422.json", %{changeset: changeset})
  end
end
