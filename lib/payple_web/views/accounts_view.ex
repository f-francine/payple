defmodule PaypleWeb.AccountsView do
  alias Payple.Account

  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance changed succesfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{transaction: %{deposit: to_account, withdraw: from_account}}) do
    %{
      message: "Transaction done succesfully",
      transaction: %{
        withdraw: %{
          id: from_account.id,
          balance: from_account.balance
        },
        deposit: %{
          id: to_account.id,
          balance: to_account.balance
        }
      }
    }
  end
end
