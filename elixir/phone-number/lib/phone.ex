defmodule Phone do
  @invalid_digits ["0", "1"]

  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("212-555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 555-0100")
  "2125550100"

  iex> Phone.number("+1 (212) 055-0100")
  "0000000000"

  iex> Phone.number("(212) 555-0100")
  "2125550100"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t()) :: String.t()
  def number(raw) do
    digits =
      ~r/\d/
      |> Regex.scan(raw)
      |> List.flatten()

    cond do
      bad_digits?(digits) ||
        invalid_characters?(raw) ||
          too_short?(digits) ->
        "0000000000"

      true ->
        digits
        |> Enum.slice(-10, 10)
        |> Enum.join()
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("212-555-0100")
  "212"

  iex> Phone.area_code("+1 (212) 555-0100")
  "212"

  iex> Phone.area_code("+1 (012) 555-0100")
  "000"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t()) :: String.t()
  def area_code(raw) do
    raw
    |> number()
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("212-555-0100")
  "(212) 555-0100"

  iex> Phone.pretty("212-155-0100")
  "(000) 000-0000"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t()) :: String.t()
  def pretty(raw) do
    digits = number(raw)

    area = String.slice(digits, -10..-8)
    exchange = String.slice(digits, -7..-5)
    remainder = String.slice(digits, -4..-1)

    "(#{area}) #{exchange}-#{remainder}"
  end

  defp too_short?(digits) do
    Enum.count(digits) < 10
  end

  defp bad_digits?(digits) do
    Enum.at(digits, -11, "1") != "1" ||
      Enum.member?(@invalid_digits, Enum.at(digits, -10)) ||
      Enum.member?(@invalid_digits, Enum.at(digits, -7))
  end

  defp invalid_characters?(raw) do
    Regex.match?(~r/[^1234567890\-+\.\(\) ]/, raw)
  end
end
