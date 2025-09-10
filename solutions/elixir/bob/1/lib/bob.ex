defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      yelling?(input) and questioning?(input) -> "Calm down, I know what I'm doing!"
      questioning?(input) -> "Sure."
      yelling?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  # upcase result is the same, and there's at least 1 uppercase letter in input
  defp yelling?(input), do: String.upcase(input) == input and has_upper?(input)
  defp questioning?(input) do
    input = String.trim(input)
    String.at(input, String.length(input)-1) == "?"
  end

  defp has_upper?(input) do
    input =~ ~r/.*[^[:digit:][:punct:][:blank:]]/
  end
end
