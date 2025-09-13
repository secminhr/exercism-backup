defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    if not String.contains?(path, ".") do
      data[path]
    else
      [first, rest] = String.split(path, ".", parts: 2, trim: true)
      extract_from_path(data[first], rest)
    end
  end

  def get_in_path(data, path) do
    get_in(data, String.split(path, ".", trim: true))
  end
end
