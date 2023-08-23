defmodule Kounter.Server do
  use GenServer
  
  alias Kounter.Core, as: Counter
  
  def init(num) do
    {:ok, Counter.new(num)}
  end
  
  def handle_call({:add, value}, _from, counter) do
    counter = Counter.add(counter, value)
    {:reply, Counter.show(counter), counter}
  end
  
  def handle_call(:show, _from, counter) do
    {:reply, Counter.show(counter), counter}
  end
  
  def handle_cast(:dec, counter) do
    {:noreply, Counter.dec(counter)}
  end
  
  def handle_cast(:inc, counter) do
    {:noreply, Counter.inc(counter)}
  end
end