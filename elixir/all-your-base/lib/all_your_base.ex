defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert([], _base_a, _base_b), do: nil

  def convert(_digits, base_a, base_b)
  when base_a < 2 or base_b < 2,
    do: nil

  def convert(digits, base_a, base_b) do
    cond do
      invalid?(digits, base_a) ->
        nil

      true ->
        digits
        |> Enum.reverse()
        |> base_to_decimal(base_a)
        |> decimal_to_base(base_b)
    end
  end

  defp base_to_decimal(digits, _base, multiplier \\ 1, sum \\ 0)
  defp base_to_decimal([], _base, _multiplier, sum), do: sum

  defp base_to_decimal([head | tail], base, multiplier, sum) do
    new_multiplier = multiplier * base
    new_sum = sum + head * multiplier
    base_to_decimal(tail, base, new_multiplier, new_sum)
  end

  defp decimal_to_base(number, base) do
    divisor = largest_divisor(number, base)
    build_digits(number, base, divisor)
  end

  defp largest_divisor(number, base, multiplier \\ 1)

  defp largest_divisor(number, base, multiplier)
       when multiplier * base > number,
       do: multiplier

  defp largest_divisor(number, base, multiplier),
    do: largest_divisor(number, base, multiplier * base)

  defp build_digits(number, base, divisor, digits \\ [])

  defp build_digits(number, base, divisor, digits) do
    digit = div(number, divisor)
    new_number = rem(number, divisor)
    new_divisor = div(divisor, base)
    new_digits = [digit | digits]

    cond do
      new_divisor == 0 ->
        Enum.reverse(new_digits)

      true ->
        build_digits(new_number, base, new_divisor, new_digits)
    end
  end

  defp invalid?(digits, base) do
    Enum.any?(digits, fn x -> x < 0 || x >= base end)
  end
end
