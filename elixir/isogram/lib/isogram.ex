defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    unique_count = letter_count(sentence, unique: true)
    full_count = letter_count(sentence, unique: false)

    full_count == unique_count
  end

  defp letter_count(sentence, unique: uniq) do
    ~r/[[:alpha:]]/
    |> Regex.scan(sentence)
    |> List.flatten()
    |> unique(uniq)
    |> Enum.count
  end

  defp unique(list, true), do: Enum.uniq(list)
  defp unique(list, false), do: list
end
