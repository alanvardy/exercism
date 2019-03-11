defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    Enum.reduce(list, [], fn x, acc -> acc ++ keep_one(x, fun) end)
  end

  defp keep_one(item, fun) do
    cond do
      fun.(item) ->
        [item]
      true ->
        []
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    Enum.reduce(list, [], fn x, acc -> acc ++ discard_one(x, fun) end)
  end

  defp discard_one(item, fun) do
    cond do
      fun.(item) ->
        []
      true ->
        [item]
    end
  end
end
