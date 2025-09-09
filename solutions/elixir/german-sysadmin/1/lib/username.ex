defmodule Username do
  defp is_lower?(c), do: ?a <= c and c <= ?z
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
      Enum.filter(&(is_lower?(&1) or &1 == ?_))
  end
end
