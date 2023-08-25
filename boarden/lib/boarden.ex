defmodule Boarden do
  def start(name) do
    DynamicSupervisor.start_child(:dsup, {Boarden.Server, name})
  end

  defdelegate check(name, guess), to: Boarden.Server

end
