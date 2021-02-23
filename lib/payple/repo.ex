defmodule Payple.Repo do
  use Ecto.Repo,
    otp_app: :payple,
    adapter: Ecto.Adapters.Postgres
end
