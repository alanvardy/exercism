defmodule Prime do
  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count, number \\ 1)
  def nth(count, _number) when count < 1, do: raise("Bad input")
  def nth(count, number) do
    cond do
      is_prime?(number) && count == 1 -> number
      is_prime?(number) -> nth(count - 1, number + 1)
      true -> nth(count, number + 1)
    end
  end

  defp is_prime?(1), do: false
  defp is_prime?(2), do: true
  defp is_prime?(number) do
    2..(number - 1)
    |> Enum.any?(fn x -> rem(number, x) == 0 end)
    |> Kernel.not()
  end
end
