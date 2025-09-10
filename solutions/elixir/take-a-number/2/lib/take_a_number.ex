defmodule TakeANumber do
  def start() do
    spawn(fn -> receive_loop(0) end)
  end

  defp receive_loop(state) do
    new_state = handler(state)

    if new_state >= 0 do
      receive_loop(new_state)
    end
  end

  defp handler(state) do
    receive do
      {:report_state, sender} -> send(sender, state)
      {:take_a_number, sender} -> send(sender, state + 1)
      :stop -> -1
      _ -> state
    end
  end
end
