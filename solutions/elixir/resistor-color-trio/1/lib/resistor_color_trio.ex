defmodule ResistorColorTrio do
  @band_value %{
    black: 0, brown: 1, red: 2, orange: 3, yellow: 4, green: 5, blue: 6, violet: 7, grey: 8, white: 9
  }
  @kilo 1000
  @mega 1000000
  @giga 1000000000
  
  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label(colors) do
    ohms = label_in_ohms(colors)
    cond do
      ohms < @kilo -> {ohms, :ohms}
      ohms < @mega -> {div(ohms, @kilo), :kiloohms}
      ohms < @giga -> {div(ohms, @mega), :megaohms}
      true -> {div(ohms, @giga), :gigaohms}
    end
  end

  defp label_in_ohms([first, second, zeros | _]), do: (@band_value[first]*10 + @band_value[second]) * (10**@band_value[zeros])
end
