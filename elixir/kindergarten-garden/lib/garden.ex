defmodule Garden do
  @children [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]

  @plants %{
    "V" => :violets,
    "R" => :radishes,
    "C" => :clover,
    "G" => :grass
  }
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @children)
  def info(info_string, student_names) do
    names = Enum.sort(student_names)

    info_string
    |> String.split("\n")
    |> Enum.map(&paired_letters/1)
    |> Enum.zip
    |> Enum.map(&build_plants/1)
    |> Enum.zip(names)
    |> assign_students()
    |> merge_defaults(names)
  end

  defp paired_letters(string) do
    ~r/\w\w/
    |> Regex.scan(string)
    |> List.flatten
  end

  defp build_plants({first, second}) do
    first <> second
    |> String.split("", trim: true)
    |> identify_plants()
  end

  defp identify_plants(letter, result \\ {})
  defp identify_plants([], result), do: result
  defp identify_plants([head | tail], result) do
    plant = Map.get(@plants, head)

    identify_plants(tail, Tuple.append(result, plant))
  end

  defp assign_students(list, result \\ %{})
  defp assign_students([], result), do: result
  defp assign_students([{plants, student} | tail], result) do
    assign_students(tail, Map.put(result, student, plants))
  end

  defp merge_defaults(data_map, student_names) do
    default_map = Enum.reduce(student_names, %{}, fn x, acc -> Map.put(acc, x, {}) end)
    Map.merge(default_map, data_map)
  end
end
