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
end
