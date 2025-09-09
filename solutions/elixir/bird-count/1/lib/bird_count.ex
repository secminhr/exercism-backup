defmodule BirdCount do
  def today([]), do: nil
  def today([h | _]), do: h

  def increment_day_count([]), do: [1]
  def increment_day_count([h | t]), do: [h+1 | t]

  def has_day_without_birds?(list) do
    List.foldl(list, false, fn x, acc -> acc or x == 0 end)
  end
  
  def total(list) do
    List.foldl(list, 0, &(&1 + &2))
  end

  def busy_days([]), do: 0
  def busy_days([h | t]) when h >= 5, do: 1 + busy_days(t)
  def busy_days([_ | t]), do: busy_days(t)
end
