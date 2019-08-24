defmodule Anagram do
  import String
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn x -> matches?(x, base) end)
  end

  defp matches?(word1, word2) do
    downcase(word1) != downcase(word2) &&
      break_down(word1) == break_down(word2)
  end

  defp break_down(string) do
    string
    |> downcase()
    |> split("", trim: true)
    |> Enum.sort()
  end
end
