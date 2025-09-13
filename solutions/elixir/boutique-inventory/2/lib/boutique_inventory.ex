defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory |> Enum.sort_by(&(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, &(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &(Map.put(&1, :name, String.replace(&1.name, old_word, new_word))))
  end

  def increase_quantity(item, count) do
    updated_quantity = Enum.into(item.quantity_by_size, %{}, fn {k, v} -> {k, v + count} end)
    Map.put(item, :quantity_by_size, updated_quantity)
  end

  def total_quantity(item) do
    Enum.sum_by(item.quantity_by_size, fn {_, quantity} -> quantity end)
  end
end
