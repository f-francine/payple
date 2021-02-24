defmodule PaypleWeb.UsersController do
  use PaypleWeb, :controller

  alias Payple.User

  def create(conn, params) do
    params
    |> Payple.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn) do
    conn
    |> put_status(:created)
    |> render("create.json", user: user)
  end
end
