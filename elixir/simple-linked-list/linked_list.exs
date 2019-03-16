defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new(), do: {:head, nil}

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    case list do
      {:head, nil} -> {:head, {elem, nil}}
      {:head, next_list} -> {:head, {elem, next_list}}
    end
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list, count \\ 0)
  def length({_, nil}, count), do: count
  def length({x, y}, count) do
    length(y, count + 1)
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    LinkedList.length(list) == 0
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek(list) do
    case list do
      {:head, nil} -> {:error, :empty_list}
      {:head, {datum, _}} -> {:ok, datum}
      _ ->
    end
  end

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail(list) do
    case list do
      {:head, nil} -> {:error, :empty_list}
      {:head, next_list} -> tail(next_list)
      {datum, next_list} -> {:ok, {:head, next_list}}
    end
  end

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop(list) do
    case list do
      {:head, {datum, next_list}} -> {:ok, datum, {:head, next_list}}
      _ -> {:error, :empty_list}
    end
  end

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list, linked_list \\ {:head, nil})
  def from_list([], linked_list), do: linked_list
  def from_list([head | tail], linked_list) do
    from_list(tail, LinkedList.push(linked_list, head))
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    # Your implementation here...
  end

  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(list) do
    # Your implementation here...
  end
end
