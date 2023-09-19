defmodule Twitterhex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TwitterhexWeb.Telemetry,
      # Start the Ecto repository
      Twitterhex.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Twitterhex.PubSub},
      # Start Finch
      {Finch, name: Twitterhex.Finch},
      # Start the Endpoint (http/https)
      TwitterhexWeb.Endpoint
      # Start a worker by calling: Twitterhex.Worker.start_link(arg)
      # {Twitterhex.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Twitterhex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TwitterhexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
