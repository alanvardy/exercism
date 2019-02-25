defmodule Bob do
  def hey(input) do
    cond do
      String.match?(input, ~r{[A-Z]!}) ->
        "Whoa, chill out!"

      String.match?(input, ~r{[A-Z]\?}) ->
        "Calm down, I know what I'm doing!"

      String.match?(input, ~r{\?$}) ->
        "Sure."

      String.match?(input, ~r{\?}) ->
        "Whatever."

      String.match?(input, ~r/[[:upper:]]{2,}/u) ->
        "Whoa, chill out!"

      String.match?(input, ~r{!}) ->
        "Whatever."

      !String.match?(input, ~r{\w}) ->
        "Fine. Be that way!"

      true ->
        "Whatever."
    end
  end
end
