defmodule PaypleWeb.AccountsView do
  alias Payple.Account
  alias Payple.Accounts.Transactions.Response, as: TransactionResponse

  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance changed succesfully",
      account: %{
        id: account_id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
    transaction: %TransactionResponse{to_account: to_account, from_account: from_account}}) do
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
