defmodule Boarden.Score do
  defstruct [:reds, :whites, :blacks]

  def new(answer, guess) do
    reds   = check_reds(answer, guess)
    blacks = check_blacks(answer, guess)
    whites = length(answer) - reds - blacks

    %__MODULE__{reds: reds, whites: whites, blacks: blacks}
  end

  def show(%{reds: reds, whites: whites, blacks: blacks}) do
    String.duplicate("R", reds) <> String.duplicate("W", whites) <> String.duplicate("B", blacks)
  end

  defp check_reds(answer, guess) do
    answer
    |> Enum.zip(guess)
    |> Enum.count(fn {x, y} -> x == y end)
  end

  defp check_blacks(answer, guess), do: length(guess -- answer)
end
