defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list, result \\ [])
  def flatten([], result), do: Enum.reverse(result)
  def flatten([[] | tail], result), do: flatten(tail, result)
  def flatten([nil | tail], result), do: flatten(tail, result)

  def flatten([head | tail], result)
      when is_list(head),
      do: flatten(head ++ tail, result)

  def flatten([head | tail], result), do: flatten(tail, [head | result])
end
