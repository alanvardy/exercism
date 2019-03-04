defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    code
    |> Integer.to_string(2)
    |> String.to_integer()
    |> convert()
  end

  def convert(code, actions \\ [], reverse \\ false) do
    cond do
      div(code, 10000) == 1 ->
        convert(rem(code,10000), actions, true)
      div(code, 1000) == 1 ->
        convert(rem(code,1000), actions ++ ["jump"], reverse)
      div(code, 100) == 1 ->
        convert(rem(code,100), actions ++ ["close your eyes"], reverse)
      div(code, 10) == 1 ->
        convert(rem(code,10), actions ++ ["double blink"], reverse)
      div(code, 1) == 1 ->
        convert(rem(code,1), actions ++ ["wink"], reverse)
      reverse == false ->
        Enum.reverse(actions)
      reverse == true ->
        actions
    end
  end
end
