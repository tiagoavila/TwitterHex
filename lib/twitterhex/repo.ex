defmodule Twitterhex.Repo do
  use Ecto.Repo,
    otp_app: :twitterhex,
    adapter: Ecto.Adapters.Postgres
end
