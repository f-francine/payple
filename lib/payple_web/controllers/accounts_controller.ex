defmodule PaypleWeb.AccountsController do
  use PaypleWeb, :controller

  alias Payple.Account

  action_fallback PaypleWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Payple.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Payple.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %{} = transaction} <- Payple.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
