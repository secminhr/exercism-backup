defmodule EliudsEggs do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number) do
    count_digits(Integer.digits(number, 2))
  end

  defp count_digits(digits), do: List.foldl(digits, 0, &+/2)
end
