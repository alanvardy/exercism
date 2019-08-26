defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @filter_regex ~r/[\{\}\[\]\(\)]/
  @pair_regex ~r/(?:\{\})|(?:\(\))|(?:\[\])|./
  @pairs ["[]", "{}", "()"]

  @spec check_brackets(String.t() | list) :: boolean
  def check_brackets(""), do: true

  def check_brackets(str) do
    str
    |> to_filtered_list(@filter_regex)
    |> Enum.join("")
    |> eliminate_pairs
  end

  defp eliminate_pairs(str) do
    remainder =
      str
      |> to_filtered_list(@pair_regex)
      |> remove_pairs()
      |> Enum.join("")

    cond do
      remainder == "" -> true
      String.length(remainder) == 1 -> false
      remainder == str -> false
      true -> eliminate_pairs(remainder)
    end
  end

  defp to_filtered_list(str, regex) do
    regex
    |> Regex.scan(str)
    |> List.flatten()
  end

  defp remove_pairs(list) do
    Enum.reject(list, fn x -> Enum.member?(@pairs, x) end)
  end
end
