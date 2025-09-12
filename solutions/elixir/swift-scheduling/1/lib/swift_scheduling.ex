defmodule SwiftScheduling do
  @doc """
  Convert delivery date descriptions to actual delivery dates, based on when the meeting started.
  """
  @spec delivery_date(NaiveDateTime.t(), String.t()) :: NaiveDateTime.t()
  def delivery_date(meeting_date, "NOW") do
    NaiveDateTime.add(meeting_date, 2, :hour) 
  end

  def delivery_date(meeting_date, "ASAP") do
    if Time.compare(NaiveDateTime.to_time(meeting_date), ~T[13:00:00]) == :lt do
      NaiveDateTime.new!(NaiveDateTime.to_date(meeting_date), ~T[17:00:00])
    else
      NaiveDateTime.new!(NaiveDateTime.to_date(meeting_date) |> Date.add(1), ~T[13:00:00])
    end
  end

  def delivery_date(meeting_date, "EOW") do
    if Date.day_of_week(meeting_date) in 1..3 do
      NaiveDateTime.new!(Date.end_of_week(meeting_date, :saturday), ~T[17:00:00])
    else
      NaiveDateTime.new!(Date.end_of_week(meeting_date, :monday), ~T[20:00:00])    
    end
  end

  def delivery_date(meeting_date, variable_delivery) do
    if String.at(variable_delivery, 0) == "Q" do
      # Q<N>
      n = String.slice(variable_delivery, 1..-1//1) |> String.to_integer()
      if Date.quarter_of_year(meeting_date) <= n do
        date = last_workday_of_quarter_of_year(n, meeting_date.year)
        NaiveDateTime.new!(date, ~T[08:00:00])
      else
        date = last_workday_of_quarter_of_year(n, meeting_date.year + 1)
        NaiveDateTime.new!(date, ~T[08:00:00])
      end
    else
      # <N>M
      n = String.slice(variable_delivery, 0..-2//1) |> String.to_integer()
      if meeting_date.month < n do
        date = first_workday_of_month_of_year(n, meeting_date.year)
        NaiveDateTime.new!(date, ~T[08:00:00])
      else
        date = first_workday_of_month_of_year(n, meeting_date.year + 1)
        NaiveDateTime.new!(date, ~T[08:00:00])
      end
    end
  end

  defp last_workday_of_quarter_of_year(quarter, year) do
    last_month = 3 * quarter
    next_month = rem(last_month + 1, 12)

    next_month_1st = if next_month < last_month do 
      Date.new!(year+1, next_month, 1) 
    else 
      Date.new!(year, next_month, 1)
    end
    last_date_last_month = Date.add(next_month_1st, -1)
    first_workday(last_date_last_month, -1)
  end

  defp first_workday_of_month_of_year(month, year) do
    month_1st = Date.new!(year, month, 1)
    first_workday(month_1st, 1)
  end

  defp first_workday(date, day_increment) do
    if Date.day_of_week(date) in 1..5, do: date, else: first_workday(Date.add(date, day_increment), day_increment)
  end
end
