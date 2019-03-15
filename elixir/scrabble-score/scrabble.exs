defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @points [
    {["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], 1},
    {["D", "G"], 2},
    {["B", "C", "M", "P"], 3},
    {["F", "H", "V", "W", "Y"], 4},
    {["K"], 5},
    {["J", "X"], 8},
    {["Q", "Z"], 10}
  ]
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase
    |> String.split("")
    |> Enum.reduce(0, fn x, acc -> acc + assess(x) end)
  end

  def assess(letter, points \\ @points)
  def assess(_, []), do: 0
  def assess(letter, [{letters, value} | tail]) do
    cond do
      Enum.member?(letters, letter) -> value
      true -> assess(letter, tail)
    end
  end
end
