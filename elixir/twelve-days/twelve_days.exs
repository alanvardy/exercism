defmodule TwelveDays do
  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """

  @numbers {
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth",
  }
  @gifts {
    "a Partridge in a Pear Tree",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming",
  }

  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    "On the " <>
      elem(@numbers, number - 1) <>
      " day of Christmas my true love gave to me: " <>
      sentence(number)
  end

  def sentence(number) do
    case number do
      0 -> "."
      1 -> elem(@gifts, number - 1) <> sentence(number - 1)
      2 -> elem(@gifts, number - 1) <> ", and " <> sentence(number - 1)
      _ -> elem(@gifts, number - 1) <> ", " <> sentence(number - 1)
    end
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    cond do
      starting_verse < ending_verse ->
        verse(starting_verse) <>
          "\n" <>
          verses(starting_verse + 1, ending_verse)
      starting_verse == ending_verse ->
        verse(ending_verse)
    end
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
