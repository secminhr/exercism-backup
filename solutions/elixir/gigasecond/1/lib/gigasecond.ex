defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  def from({{year, month, day}, {hours, minutes, seconds}}) do
    date = NaiveDateTime.new!(year, month, day, hours, minutes, seconds) 
      |> NaiveDateTime.add(1000000000, :second)
    {{date.year, date.month, date.day}, {date.hour, date.minute, date.second}}
  end
end
