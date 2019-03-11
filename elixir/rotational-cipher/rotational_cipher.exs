defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(fn x -> rotate_letter(x, rem(shift, 26)) end)
    |> List.to_string()
  end

  defp rotate_letter(letter, shift) do
    letter
    case letter do
      letter when letter in 97..122 ->
          rem(letter + shift - 97, 26) + 97

      letter when letter in 65..90 ->
          rem(letter + shift - 65, 26) + 65

      _ -> letter
    end
  end
end
