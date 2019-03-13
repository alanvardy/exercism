defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  @roman_numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"},
    {0, ""},
  ]

  @spec numerals(pos_integer) :: String.t()
  def numerals(num) do
    rn = @roman_numerals
    |> Enum.filter(fn {x, _} -> x <= num end)
    |> Enum.at(0)

    case rn do
     {0, _} -> ""
     {x, y} -> y <> numerals(num - x)
    end
  end
end
