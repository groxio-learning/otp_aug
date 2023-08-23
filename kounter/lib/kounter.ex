defmodule Kounter do
	alias Kounter.Server

	def start_link(num \\ 0) do
		GenServer.start_link(Server, num)
	end

	def add(counter_pid, value) do
		GenServer.call(counter_pid, {:add, value})
	end

	def show(counter_pid) do
		GenServer.call(counter_pid, :show)
	end

	def dec(counter_pid) do
		GenServer.cast(counter_pid, :dec)
	end

	def inc(counter_pid) do
		GenServer.cast(counter_pid, :inc)
	end
end
