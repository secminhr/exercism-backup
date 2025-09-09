defmodule NameBadge do
  def print(id, name, department) do
    department = if department == nil, do: "OWNER", else: department

    if id == nil do
      "#{name} - #{String.upcase(department)}"
    else 
      "[#{id}] - #{name} - #{String.upcase(department)}"
    end
  end
end
