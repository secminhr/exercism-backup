defmodule Username do
  defp lower_or_underscore?(c), do: (?a <= c and c <= ?z) or c == ?_
  defp substitute(c) do
    case c do
      ?ä -> ~c"ae"
      ?ö -> ~c"oe"
      ?ü -> ~c"ue"
      ?ß -> ~c"ss"
      _ -> [c]    
    end
  end
  
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    Enum.flat_map(username, &substitute/1) |> 
      Enum.filter(&lower_or_underscore?/1)
  end
end
