defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()

  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(fn x -> translate_word(x) end)
    |> Enum.join(" ")
  end


  defp translate_word(word) do
      ~r/(?<consonants>[x,y][^aeiou]\w+|^[^aeiou]qu|^qu|^[^aeiou]+)(?<remainder>\w*)/
      |> Regex.named_captures(word)
      |> transform(word)
  end

  defp transform(captures, word) do
    cond do
      captures ->
        Map.get(captures, "remainder") <>
          Map.get(captures, "consonants") <>
          "ay"

      true ->
        word <> "ay"
    end
  end
end
