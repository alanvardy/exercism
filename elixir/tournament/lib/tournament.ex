defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> Enum.map(fn x -> String.split(x, ";") end)
    |> process_game()
    |> Map.to_list()
    |> add_metadata()
    |> Enum.sort(&greater_than?(&1, &2))
    |> print_scoreboard()
    |> String.trim()
  end

  defp process_game(input, processed_data \\ %{})
  defp process_game([], processed_data), do: processed_data

  defp process_game([[team1, team2, "win"] | tail], processed_data) do
    new_data =
      processed_data
      |> add_win(team1)
      |> add_loss(team2)

    process_game(tail, new_data)
  end

  defp process_game([[team1, team2, "loss"] | tail], processed_data) do
    new_data =
      processed_data
      |> add_win(team2)
      |> add_loss(team1)

    process_game(tail, new_data)
  end

  defp process_game([[team1, team2, "draw"] | tail], processed_data) do
    new_data =
      processed_data
      |> add_draw(team1)
      |> add_draw(team2)

    process_game(tail, new_data)
  end

  defp process_game([_ | tail], processed_data) do
    process_game(tail, processed_data)
  end

  defp add_win(data, team) do
    Map.update(data, team, %{w: 1, d: 0, l: 0}, fn x -> %{x | w: x.w + 1} end)
  end

  defp add_loss(data, team) do
    Map.update(data, team, %{w: 0, d: 0, l: 1}, fn x -> %{x | l: x.l + 1} end)
  end

  defp add_draw(data, team) do
    Map.update(data, team, %{w: 0, d: 1, l: 0}, fn x -> %{x | d: x.d + 1} end)
  end

  defp add_metadata(_data, new_data \\ [])
  defp add_metadata([], new_data), do: new_data

  defp add_metadata([{k, v} | tail], new_data) do
    matches_played = v.w + v.l + v.d
    points = v.w * 3 + v.d

    new_v =
      v
      |> Map.put(:mp, matches_played)
      |> Map.put(:p, points)

    add_metadata(tail, [{k, new_v} | new_data])
  end

  defp print_scoreboard(data) do
    data
    |> Enum.map(&build_line/1)
    |> List.insert_at(0, build_header())
    |> Enum.join("\n")
  end

  defp build_header() do
    String.pad_trailing("Team", 31) <>
      "| MP " <>
      "|  W " <>
      "|  D " <>
      "|  L " <>
      "|  P"
  end

  defp build_line({team, scores}) do
    String.pad_trailing(team, 31) <>
      "|  #{scores.mp} " <>
      "|  #{scores.w} " <>
      "|  #{scores.d} " <>
      "|  #{scores.l} " <>
      "|  #{scores.p}"
  end

  defp greater_than?(item1, item2) do
    cond do
      get_points(item1) > get_points(item2) ->
        true

      get_points(item1) < get_points(item2) ->
        false

      true ->
        get_name(item1) < get_name(item2)
    end
  end

  defp get_points(item) do
    item
    |> elem(1)
    |> Map.get(:p)
  end

  defp get_name(item) do
    item
    |> elem(0)
  end
end
