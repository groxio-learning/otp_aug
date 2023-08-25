defmodule Boarden.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Boarden.Worker.start_link(arg)
      # {Boarden.Server, :dead_pool},
      # {Boarden.Server, :batman},
      # {Boarden.Server, :superman},
      # {Boarden.Server, :green_lanten}
      {DynamicSupervisor, name: :dsup, strategy: :one_for_one}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Boarden.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
