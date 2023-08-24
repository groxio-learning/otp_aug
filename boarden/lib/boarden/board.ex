defmodule Boarden.Board do
  defstruct turns: [], answer: [1, 2, 3, 4]

  alias Boarden.Score

  def new() do
    answer =
      1..8
      |> Enum.shuffle()
      |> Enum.take(4)

    %__MODULE__{answer: answer}
  end

  def check(board, turn) do
    %{board | turns: [turn | board.turns]}
  end

  def show(%__MODULE__{turns: turns, answer: answer} = _board) do
    turns
    |> Enum.map(fn turn ->
      turns = Enum.join(turn, " ")
      row_str = show_row(turn, answer)

      "#{turns} | #{row_str}"
    end)
    |> Enum.join("\n")
    |> Kernel.<>("\n")
  end

  defp show_row(turn, answer) do
    answer
    |> Score.new(turn)
    |> Score.show()
  end
end
