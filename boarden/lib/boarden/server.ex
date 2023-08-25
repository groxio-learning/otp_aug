defmodule Boarden.Server do
  use GenServer

  alias Boarden.Board

  @impl true
  def init(_) do
    {:ok, Board.new()}
  end

  @impl true
  def handle_call({:check, guess}, _from, board) do
    new_board = Board.check(board,guess)
    {:reply,Board.show(new_board),new_board}
  end

  @impl true
  def handle_call(:show, _from, board) do
    {:reply, Board.show(board),board}
  end

  # Client API

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: :server)
  end

  def check(pid \\ :server, guess) do
    GenServer.call(pid, {:check, guess})
    |> IO.puts
  end

  def show(pid \\ :server) do
    GenServer.call(pid, :show)
    |> IO.puts
  end
end
