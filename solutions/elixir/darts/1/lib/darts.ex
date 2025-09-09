defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score(position) do
    cond do
      distance_square(position) > 100 -> 0
      distance_square(position) > 25 -> 1
      distance_square(position) > 1 -> 5
      true -> 10
    end
  end

  defp distance_square({x, y}), do: x*x + y*y
end
