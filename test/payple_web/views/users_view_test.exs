defmodule PaypleWeb.UsersViewTest do
  use PaypleWeb.ConnCase, async: true

  import Phoenix.View # To be able to use render() in line 20

  alias Payple.{Account, User}
  alias PaypleWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Fran",
      password: "greysanatomy",
      nickname: "fran",
      email: "fran@sapo.com",
      age: 18
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Payple.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
          },
        id: user_id,
        name: "Fran",
        nickname: "fran"
      }
        }
    assert expected_response == response
  end
end
