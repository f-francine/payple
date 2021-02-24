defmodule Payple do
  alias Payple.Users.Create, as: UserCreate

  defdelegate create_user(params), to: UserCreate, as: :call
end
