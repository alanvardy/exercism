defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """
  @weekdays %{
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6,
    sunday: 7
  }

  @type weekday ::
          :monday
          | :tuesday
          | :wednesday
          | :thursday
          | :friday
          | :saturday
          | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date()
  def meetup(year, month, weekday, schedule) do
    build_dates(year, month)
    |> Enum.filter(fn date -> is_day?(date, weekday) end)
    |> get_date(schedule)
    |> to_tuple()
  end

  defp build_dates(year, month) do
    date = create_date(year, month, 1)

    1..Date.days_in_month(date)
    |> Enum.map(fn day -> create_date(year, month, day) end)
  end

  defp create_date(year, month, day) do
    {:ok, date} = Date.new(year, month, day)
    date
  end

  defp is_day?(date, weekday) do
    day = Map.get(@weekdays, weekday)

    Date.day_of_week(date) == day
  end

  defp get_date(dates, :teenth) do
    Enum.find(dates, fn date -> teenth?(date) end)
  end

  defp get_date(dates, :first), do: List.first(dates)
  defp get_date(dates, :second), do: Enum.at(dates, 1)
  defp get_date(dates, :third), do: Enum.at(dates, 2)
  defp get_date(dates, :fourth), do: Enum.at(dates, 3)
  defp get_date(dates, :last), do: List.last(dates)

  defp teenth?(date) do
    13..19
    |> Enum.member?(date.day)
  end

  defp to_tuple(date) do
    {date.year, date.month, date.day}
  end
end
