defmodule Payple do
  alias Payple.Users.Create, as: UserCreate
  alias Payple.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call
end
