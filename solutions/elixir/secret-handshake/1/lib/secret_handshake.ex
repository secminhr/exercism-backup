defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    reverse = div(code, 16)
    actions = trimmed_commands(rem(code, 16), 0)    
    if reverse == 1, do: Enum.reverse(actions), else: actions
  end

  @actions %{0 => "wink", 1 => "double blink", 2 => "close your eyes", 3 => "jump"}
  
  defp trimmed_commands(code, shift) when shift in 0..3 do
    rest = trimmed_commands(Bitwise.">>>"(code, 1), shift+1)
    if rem(code, 2) == 1, do: [@actions[shift] | rest], else: rest
  end

  defp trimmed_commands(_, _) do
    []
  end
end
