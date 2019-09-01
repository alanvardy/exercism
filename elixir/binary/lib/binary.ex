defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    numbers =
      ~r/[10]/
      |> Regex.scan(string)
      |> List.flatten()

    cond do
      same_length?(numbers, string) ->
        numbers
        |> Enum.map(&String.to_integer/1)
        |> Enum.reverse()
        |> to_decimal(1, 0)

      true ->
        0
    end
  end

  defp to_decimal([], _place, total), do: total

  defp to_decimal([head | tail], place, total) do
    to_decimal(tail, place * 2, total + head * place)
  end

  defp same_length?(numbers, string) do
    Enum.count(numbers) == String.length(string)
  end
end
