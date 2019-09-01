defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, _workers) do
    texts
    |> Enum.map(fn text -> String.split(text, "\n", trim: true) end)
    |> List.flatten()
    |> Enum.map(fn line -> Task.async(fn -> count_letters(line) end) end)
    |> Enum.reduce(%{}, fn task, acc -> merge(acc, task) end)
  end

  def count_letters(line) do
    list =
      ~r/[[:alpha:]]/u
      |> Regex.scan(String.downcase(line))
      |> List.flatten()

    Enum.uniq(list)
    |> Enum.map(fn letter -> letters_in_list(letter, list) end)
    |> Enum.into(%{})
  end

  defp letters_in_list(letter, list) do
    count = Enum.count(list, fn x -> x == letter end)

    {letter, count}
  end

  defp merge(acc, task) do
    Map.merge(acc, Task.await(task), fn _k, v1, v2 -> v1 + v2 end)
  end
end
