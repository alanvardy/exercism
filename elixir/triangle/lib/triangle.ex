defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene
  defguard not_positive_sides(a, b, c)
           when a <= 0 or b <= 0 or c <= 0

  defguard impossible_lengths(a, b, c)
           when a >= b + c or b >= a + c or c >= a + b

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c)
      when not_positive_sides(a, b, c),
      do: {:error, "all side lengths must be positive"}

  def kind(a, b, c)
      when impossible_lengths(a, b, c),
      do: {:error, "side lengths violate triangle inequality"}

  def kind(a, b, c) do
    equal_sides =
      [a, b, c]
      |> Enum.uniq()
      |> Enum.count()

    cond do
      equal_sides == 1 -> {:ok, :equilateral}
      equal_sides == 2 -> {:ok, :isosceles}
      equal_sides == 3 -> {:ok, :scalene}
    end
  end
end
