defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when length(a) == length(b) do
    if a == b, do: :equal, else: :unequal
  end

  def compare(a, b) when length(a) > length(b) do
    if contains?(a, b), do: :superlist, else: :unequal
  end

  def compare(a, b) when length(a) < length(b) do
    if contains?(b, a), do: :sublist, else: :unequal
  end

  @doc """
  check if a starts with b
  """
  defp start_with?(_, []), do: true
  defp start_with?([], _), do: false
  defp start_with?([xa|ta], [xb|tb]), do: xa === xb and start_with?(ta, tb)

  @doc """
  check if a contains b
  """
  defp contains?(_, []), do: true
  defp contains?([], _), do: false
  defp contains?(a, b) do
    if hd(a) !== hd(b) do
      contains?(tl(a), b)
    else
      start_with?(a, b) or contains?(tl(a), b)
    end
  end
end
