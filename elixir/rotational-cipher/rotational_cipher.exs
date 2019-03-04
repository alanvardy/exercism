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
    |> String.split("")
    |> rotate_letter(rem(shift, 26))
    |> Enum.join()
  end

  def rotate_letter(list, shift, code \\ [])
  def rotate_letter([], shift, code) do
    code
  end
  def rotate_letter([head | tail], shift, code) do
    # if uppercase letter
    
    # if lowercase letter

  end
end
