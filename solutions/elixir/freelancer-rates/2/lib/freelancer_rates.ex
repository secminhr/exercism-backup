defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
     before_discount * (100 - discount) / 100
  end

  def monthly_rate(hourly_rate, discount) do
    trunc(Float.ceil(apply_discount(daily_rate(hourly_rate) * 22, discount)))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # daily_rate(hourly_rate) * days * (100 - discount) / 100 <= budget
    discount_percent = (100 - discount) / 100
    Float.floor(budget / discount_percent / daily_rate(hourly_rate), 1)
  end
end
