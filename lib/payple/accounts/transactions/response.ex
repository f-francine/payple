defmodule Payple.Accounts.Transactions.Response do
  alias Payple.Account

  defstruct [:from_account, :to_account]

  def build(%Account{} = from_account, %Account{} = to_account) do
    %__MODULE__{
    from_account: from_account, # Withdraw
    to_account: to_account # Deposit
    }
  end
end
