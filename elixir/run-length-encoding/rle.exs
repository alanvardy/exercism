defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.split("")
    |> List.flatten()
    |> aggregate()
    |> Enum.join()
  end

  defp aggregate(list, letters \\ {"", 0})
  defp aggregate([], letters) do
    []
  end
  defp aggregate([head | tail], letters) do
    case letters do
      {^head, x} -> [aggregate(tail, {head, x + 1})]
      {y, 0} -> [aggregate(tail, {head, 1})]
      {y, 1} ->
        [y | aggregate(tail, {head, 1})]
      {y, x} ->
        [Integer.to_string(x) <>
          y | aggregate(tail, {head, 1})]

    end
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    ~r/\d*[a-zA-Z]|\d* /
    |> Regex.scan(string)
    |> List.flatten()
    |> Enum.map(fn x -> split_up(x) end)
    |> Enum.join
  end

  defp split_up(string) do
    components = ~r/(?<number>\d*)(?<letter> |\w)/
    |> Regex.named_captures(string)

    cond do
      Map.get(components, "number") == "" ->
        Map.get(components, "letter")
      true ->
        String.duplicate(Map.get(components, "letter"), String.to_integer(Map.get(components, "number")))
    end
  end
end
