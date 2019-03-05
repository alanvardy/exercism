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
    |> rotate_letter(rem(shift, 26))
    |> List.to_string()
  end

  defp rotate_letter([], _shift) do
    []
  end

  defp rotate_letter([head | tail], shift) do
    case head do
      head when head in 97..122 ->
        [
          rem(head + shift - 97, 26) + 97
          | rotate_letter(tail, shift)
        ]

      head when head in 65..90 ->
        [
          rem(head + shift - 65, 26) + 65
          | rotate_letter(tail, shift)
        ]

      _ ->
        [head | rotate_letter(tail, shift)]

        # true ->
        #   [
        #     String.upcase(rem(String.downcase(head) + shift - 97, 26) + 97)
        #     | rotate_letter(tail, shift)
        #   ]
    end
  end
end
