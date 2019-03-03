defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> scan()
    |> List.flatten()
    |> tally()
  end

  def tally(list, map \\ Map.new())

  def tally([], map) do
    map
  end

  def tally([head | tail], map) do
    tally(tail, Map.update(map, head, 1, &(&1 + 1)))
  end

  def scan(sentence) do
    Regex.scan(~r/[[:alnum:]-ö]+/, sentence)
  end
end
