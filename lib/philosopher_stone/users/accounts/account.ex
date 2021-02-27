defmodule PhilosopherStone.User.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_attrs [:balance, :user_id]

  schema "accounts" do
    field :balance, :decimal
    belongs_to :user, PhilosopherStone.User

    timestamps()
  end

  def changeset(account = %__MODULE__{}, attrs) do
    account
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> check_constraint(:balance,
      name: :balance_greater_then_or_equal_to_zero,
      message: "balance cannot be lower then 0"
    )
  end
end
