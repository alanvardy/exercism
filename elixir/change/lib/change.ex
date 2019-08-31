defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t()}
  def generate(_coins, target) when target == 0, do: {:ok, []}
  def generate(_coins, target) when target < 0, do: {:error, "cannot change"}

  def generate(coins, target) do
    result =
      coins
      |> all_permutations(target)
      |> Enum.filter(fn x -> Enum.sum(x) == target end)
      |> Enum.sort(&(Enum.count(&1) <= Enum.count(&2)))
      |> List.first()

    case result do
      nil -> {:error, "cannot change"}
      _ -> {:ok, result}
    end
  end

  defp all_permutations(coins, target, permutations \\ [])
  defp all_permutations([], _target, permutations), do: permutations

  defp all_permutations([head | tail], target, []) do
    max_count = get_max_count(target, head)
    permutations = for x <- 0..max_count, do: List.duplicate(head, x)

    all_permutations(tail, target, permutations)
  end

  defp all_permutations([head | tail], target, permutations) do
    max_count = get_max_count(target, head)

    permutations = for x <- permutations, y <- 0..max_count, do: x ++ List.duplicate(head, y)
    permutations = Enum.reject(permutations, fn x -> Enum.sum(x) > target end)

    all_permutations(tail, target, permutations)
  end

  defp get_max_count(target, 100), do: div(target, 100)

  defp get_max_count(target, head) do
    target
    |> div(head)
    |> min(5)
  end
end
