defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r{[A-Z]!}, input) ->
        "Whoa, chill out!"

      Regex.match?(~r{[A-Z]\?}, input) ->
        "Calm down, I know what I'm doing!"

      Regex.match?(~r{\?$}, input) ->
        "Sure."

      Regex.match?(~r{\?}, input) ->
        "Whatever."

      Regex.match?(~r/[[:upper:]]{2,}/u, input) ->
        "Whoa, chill out!"

      Regex.match?(~r{!}, input) ->
        "Whatever."

      !Regex.match?(~r{\w}, input) ->
        "Fine. Be that way!"

      true ->
        "Whatever."
    end
  end
end
