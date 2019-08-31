defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number, result \\ 1)

  def square(number, _result)
      when number not in 1..64,
      do: {:error, "The requested square must be between 1 and 64 (inclusive)"}

  def square(1, result), do: {:ok, result}

  def square(number, result) do
    square(number - 1, result * 2)
  end

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total do
    sum =
      1..64
      |> Enum.map(fn x -> elem(square(x), 1) end)
      |> Enum.reduce(fn x, acc -> x + acc end)

    {:ok, sum}
  end
end
