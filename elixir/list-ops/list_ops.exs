defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l, num \\ 0)
  def count([], num), do: num

  def count([_ | tail], num) do
    count(tail, num + 1)
  end

  @spec reverse(list) :: list
  def reverse(l, new \\ [])
  def reverse([], new), do: new

  def reverse([head | tail], new) do
    reverse(tail, [head | new])
  end

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []

  def map([head | tail], f) do
    [f.(head) | map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []

  def filter([head | tail], f) do
    cond do
      f.(head) -> [head | filter(tail, f)]
      true -> filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc

  def reduce([head | tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append([], []), do: []

  def append([], [head | tail]) do
    [head | append(tail, [])]
  end

  def append([head | tail], b) do
    [head | append(tail, b)]
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([x]), do: x

  def concat([head | tail]) do
    head ++ concat(tail)
  end
end
