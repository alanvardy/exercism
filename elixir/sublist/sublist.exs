defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      equal?(a, b) -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp equal?([], []), do: true
  defp equal?(_, []), do: false
  defp equal?([], _), do: false
  defp equal?([head1 | tail1], [head2 | tail2]) do
    cond do
      head1 === head2 -> equal?(tail1, tail2)
      true -> false
    end
  end

  defp sublist?([], _), do: true
  defp sublist?(_, []), do: false
  defp sublist?(a, b) do
    b
    |> permutations()
    |> Enum.map(fn x -> strict_match(a, x) end) #cant be each separate element
    |> Enum.any?()
  end

  defp permutations([]), do: []
  defp permutations([head | tail]) do
    [[head | tail] | permutations(tail)]
  end

  defp strict_match([], []), do: true
  defp strict_match([], _), do: true
  defp strict_match(_, []), do: false
  defp strict_match([head1 | tail1], [head2 | tail2]) do
    cond do
      head1 === head2 -> strict_match(tail1, tail2)
      true -> false
    end
  end
end
