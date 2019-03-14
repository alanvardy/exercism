defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @sounds %{
    1 => "",
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    @sounds
    |> Enum.filter(fn {x, y} -> rem(number, x) == 0 end)
    |> Enum.map(fn {x, y} -> y end)
    |> Enum.join()
    |> check_for(number)
  end

  defp check_for(string, number) do
    case string do
      "" -> Integer.to_string(number)
      _ -> string
    end
  end
end
