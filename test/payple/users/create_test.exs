defmodule Payple.Users.CreateTest do
  use Payple.DataCase, async: true

  alias Payple.User
  alias Payple.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Fran",
        password: "greysanatomy",
        nickname: "fran",
        email: "fran@sapo.com",
        age: 19
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{name: "Fran", age: 19, id: ^user_id} = user
    end

    test "when all params are invalid, returns an error" do
      params = %{
        name: "Fran",
        password: "greysanatomy",
        nickname: "fran",
        email: "fran@sapo.com",
        age: 17
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
