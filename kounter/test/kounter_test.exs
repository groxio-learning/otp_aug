defmodule KounterTest do
  use ExUnit.Case
  doctest Kounter

  test "greets the world" do
    assert Kounter.hello() == :world
  end
end
