defmodule Kounter.Server do
  use GenServer

  alias Kounter.Core, as: Counter


  @impl true
  def init(num) do
    IO.puts "new counter with value #{num}"
    {:ok, Counter.new(num)}
  end

  @impl true
  def handle_call({:add, value}, _from, counter) do
    counter = Counter.add(counter, value)
    {:reply, Counter.show(counter), counter}
  end

  @impl true
  def handle_call(:show, _from, counter) do
    {:reply, Counter.show(counter), counter}
  end

  @impl true
  def handle_cast(:dec, counter) do
    {:noreply, Counter.dec(counter)}
  end

  @impl true
  def handle_cast(:inc, counter) do
    {:noreply, Counter.inc(counter)}
  end

  def start_link(num \\ 0) do
		GenServer.start_link(__MODULE__, num, name: :server)
	end

	def add(counter_pid \\ :server, value) do
		GenServer.call(counter_pid, {:add, value})
	end

	def show(counter_pid \\ :server) do
		GenServer.call(counter_pid, :show)
	end

	def dec(counter_pid \\ :server) do
		GenServer.cast(counter_pid, :dec)
	end

	def inc(counter_pid \\ :server) do
		GenServer.cast(counter_pid, :inc)
	end
end
