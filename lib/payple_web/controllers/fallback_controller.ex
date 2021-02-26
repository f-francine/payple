defmodule PaypleWeb.FallbackController do
  use PaypleWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(PaypleWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
