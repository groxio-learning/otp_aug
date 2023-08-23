defmodule Kounter.Service do
  alias Kounter.Core, as: Counter
  def start(num) do
    spawn(fn -> num |> Counter.new() |> loop end)
  end

  def loop(counter) do
    counter
    |> listen
    |> loop
  end

  def listen(counter) do
    receive do
      {{:add, value}, from} ->
        counter = Counter.add(counter, value)
        send from, Counter.show(counter)
        counter
      :inc ->
        Counter.inc(counter)
      :dec ->
        Counter.dec(counter)
      {:show, from} ->
        send from, Counter.show(counter)
        counter
    end
  end

  def inc(counter_pid) do
    send counter_pid, :inc
  end
  def dec(counter_pid) do
    send counter_pid, :dec
  end
  def add(counter_pid,val) do
    send counter_pid, {{:add, val},self()}
    receive do
      message ->
        message
    end
  end
  def show(counter_pid) do
    send counter_pid, {:show, self()}
    receive do
      message ->
        message
    end
  end
end
