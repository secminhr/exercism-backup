defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 and not legacy? -> :trace 
      level == 1 -> :debug 
      level == 2 -> :info 
      level == 3 -> :warning 
      level == 4 -> :error 
      level == 5 and not legacy? -> :fatal 
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      to_label(level, legacy?) == :error -> :ops 
      to_label(level, legacy?) == :fatal -> :ops 
      to_label(level, legacy?) == :unknown -> if legacy? do :dev1 else :dev2 end
      true -> false
    end
  end
end
