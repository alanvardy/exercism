defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2, distance \\ 0)
  def hamming_distance([], [], distance), do: {:ok, distance}

  def hamming_distance(strand1, strand2, _distance)
      when strand1 == [] or strand2 == [],
      do: {:error, "Lists must be the same length"}

  def hamming_distance([head | tail], [head2 | tail2], distance) do
    new_distance =
      cond do
        head != head2 -> distance + 1
        true -> distance
      end

    hamming_distance(tail, tail2, new_distance)
  end
end
