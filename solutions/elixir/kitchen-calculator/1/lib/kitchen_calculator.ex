defmodule KitchenCalculator do
  def get_volume({_, volume}) do
    volume
  end

  defp unit_to_milliliters(:cup), do: 240
  defp unit_to_milliliters(:fluid_ounce), do: 30
  defp unit_to_milliliters(:teaspoon), do: 5
  defp unit_to_milliliters(:tablespoon), do: 15
  defp unit_to_milliliters(:milliliter), do: 1

  def to_milliliter({unit, volume}) do
    {:milliliter, unit_to_milliliters(unit) * volume}
  end

  def from_milliliter({_, volume}, unit) do
    {unit, volume / unit_to_milliliters(unit)}
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
