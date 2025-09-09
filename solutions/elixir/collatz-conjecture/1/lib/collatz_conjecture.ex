defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when input > 0 do
    calculate(input, 0)
  end

  defp calculate(1, steps), do: steps
  defp calculate(n, steps) when rem(n, 2) == 0, do: calculate(div(n, 2), steps + 1)
  defp calculate(n, steps) when rem(n, 2) == 1, do: calculate(3 * n + 1, steps + 1)
end
