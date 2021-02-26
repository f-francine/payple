defmodule PaypleWeb.UsersController do
  use PaypleWeb, :controller

  alias Payple.User

  action_fallback PaypleWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Payple.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
