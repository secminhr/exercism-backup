defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    search_in_range(1..radicand, radicand)
  end

  defp search_in_range(range, square_target) do
    if Range.size(range) == 0 do 
      -1
    else 
      mid = div(range.first + range.last, 2)
      mid_square = mid ** 2
      cond do
        square_target == mid_square -> mid
        square_target < mid_square -> search_in_range(range.first..(mid-1)//1, square_target)
        square_target > mid_square -> search_in_range((mid+1)..range.last//1, square_target)
      end
    end
  end
end
