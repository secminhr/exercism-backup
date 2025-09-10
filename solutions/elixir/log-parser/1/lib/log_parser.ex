defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    Regex.split(~r/<[~*=-]*>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  def tag_with_user_name(line) do
    if String.contains?(line, "User") do
      [_, username] = Regex.run(~r/User\s+(\S+)/, line)
      "[USER] #{username} #{line}"
    else
      line
    end
  end
end
