defmodule BoardTest do
  use ExUnit.Case

  alias Boarden.Board

  test "CRC test" do
    expected =
      """
      4 2 3 3 | RRWB
      4 3 2 2 | WWWB
      4 3 2 1 | WWWW
      """

    actual =
      board()
      |> Board.check([4, 3, 2, 1])
      |> assert_key(:turns, [[4, 3, 2, 1]])
      |> Board.check([4, 3, 2, 2])
      |> assert_key(:turns, [[4, 3, 2, 2], [4, 3, 2, 1]])
      |> Board.check([4, 2, 3, 3])
      |> assert_key(:turns, [[4, 2, 3, 3], [4, 3, 2, 2], [4, 3, 2, 1]])
      |> Board.show

    assert actual == expected
  end

  defp board, do: %Board{}

  defp assert_key(board, key, value) do
    assert Map.get(board, key) == value

    board
  end
end
