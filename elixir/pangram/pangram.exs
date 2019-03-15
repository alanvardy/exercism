defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    sentence
    |> String.downcase
    |> String.split("")
    |> Enum.uniq()
    |> Enum.count(fn x -> alpha?(x) end)
    |> Integer.to_string()
    |> String.equivalent?("26")
  end

  defp alpha?(letter) do
    Regex.match?(~r/[a-z]/, letter)
  end
end
