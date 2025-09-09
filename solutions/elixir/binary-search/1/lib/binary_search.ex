defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found  
  def search(numbers, key) do
    case searchl(Tuple.to_list(numbers), key) do
      {:not_found, _} -> :not_found
      ok -> ok
    end
  end

  defp searchl([], _), do: {:not_found, 0}
  defp searchl(numbers, key) do
    mid_index = div(length(numbers), 2)
    {l, [mid_val|r]} = Enum.split(numbers, mid_index)

    cond do
      key == mid_val -> {:ok, mid_index}
      key < mid_val -> searchl(l, key)
      key > mid_val -> searchl(r, key) |> add(mid_index+1)
    end 
  end

  defp add(result, increment), do: put_elem(result, 1, elem(result, 1) + increment)
end
