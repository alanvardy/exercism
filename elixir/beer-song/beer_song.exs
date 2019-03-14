defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    "#{count(number, true)} #{bottles(number)} on the wall, " <>
      "#{count(number)} #{bottles(number)}.\n" <>
      action_taken(number)
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0)

  def lyrics(range) do
    range
    |> Enum.map(fn x -> verse(x) end)
    |> Enum.join("\n")
  end

  defp bottles(1), do: "bottle of beer"
  defp bottles(_), do: "bottles of beer"

  defp article(1), do: "it"
  defp article(_), do: "one"

  defp count(number, capitalize \\ false)
  defp count(0, true), do: "No more"
  defp count(0, false), do: "no more"
  defp count(number, _), do: number

  defp action_taken(0), do: "Go to the store and buy some more, " <> contemplate(99)
  defp action_taken(number), do: "Take #{article(number)} down and pass it around, " <> contemplate(number - 1)

  defp contemplate(number) do
    "#{count(number)} #{bottles(number)} on the wall.\n"
  end
end
