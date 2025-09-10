defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    date = NaiveDateTime.to_date(datetime)
    noon = NaiveDateTime.new!(date, ~T[12:00:00])
    NaiveDateTime.compare(datetime, noon) == :lt
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      Date.add(NaiveDateTime.to_date(checkout_datetime), 28)
    else
      Date.add(NaiveDateTime.to_date(checkout_datetime), 29)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)
    max(Date.diff(actual_return_date, planned_return_date), 0)
  end

  def monday?(datetime) do
    Date.day_of_week(NaiveDateTime.to_date(datetime)) == 1
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    actual_return_datetime = datetime_from_string(return)
    planned_datetime = return_date(checkout_datetime)
    days = days_late(planned_datetime, actual_return_datetime)

    total_fee = days * rate
    if monday?(actual_return_datetime), do: div(total_fee, 2), else: total_fee
  end
end
