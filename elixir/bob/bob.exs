defmodule Bob do
  def hey(input) do
    cond do
      input =~ ~r{[A-Z]!} -> "Whoa, chill out!"
      input =~ ~r{[A-Z]\?} -> "Calm down, I know what I'm doing!"
      input =~ ~r{\?$} -> "Sure."
      input =~ ~r{\?} -> "Whatever."
      input =~ ~r/[[:upper:]]{2,}/u -> "Whoa, chill out!"
      input =~ ~r{!} -> "Whatever."
      !(input =~ ~r{\w}) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end
