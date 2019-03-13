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
    cond do
      Regex.match?(~r/^[aeiou]/, phrase) -> phrase <> "ay"
      Regex.match?(~r/^[^aeiou]{3}/, phrase) -> String.slice(phrase, 3..-1) <> String.slice(phrase, 0..2) <> "ay"
      Regex.match?(~r/^[^aeiou]{2}/, phrase) -> String.slice(phrase, 2..-1) <> String.slice(phrase, 0..1) <> "ay"
      true -> String.slice(phrase, 1..-1) <> String.slice(phrase, 0..0) <> "ay"
    end
  end
end
