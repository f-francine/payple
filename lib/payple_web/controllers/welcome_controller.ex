defmodule PaypleWeb.WelcomeController do
  use PaypleWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to Payple API! :)")
  end
end
