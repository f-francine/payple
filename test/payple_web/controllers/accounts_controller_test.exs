defmodule PaypleWeb.AccountsControllerTest do
  use PaypleWeb.ConnCase, async: true

  alias Payple.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Fran",
        password: "greysanatomy",
        nickname: "fran",
        email: "fran@sapo.com",
        age: 19
      }

      {:ok, %User{account: %Account{id: account_id}}} = Payple.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic bmltZGE6emFtaWF0aW4=")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, do the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
      |> post(Routes.accounts_path(conn, :deposit, account_id, params))
      |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id},
        "message" => "Balance changed succesfully"
      } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "coin"}

      response =
        conn
      |> post(Routes.accounts_path(conn, :deposit, account_id, params))
      |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
