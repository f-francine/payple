defmodule Payple.Users.Create do
  alias Payple.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
