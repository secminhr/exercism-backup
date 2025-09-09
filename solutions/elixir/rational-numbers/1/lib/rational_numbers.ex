defmodule RationalNumbers do
  @type rational :: {integer, integer}

  defp neg({num, den}) do
    {-num, den}
  end

  defp reciprocal({num, den}) do 
    {den, num}
  end

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({num_a, den_a}, {num_b, den_b}) do
    reduce({num_a*den_b + num_b*den_a, den_a*den_b})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    reduce(add(a, neg(b)))
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num_a, den_a}, {num_b, den_b}) do
    reduce({num_a * num_b, den_a * den_b})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(a, b) do
    reduce(multiply(a, reciprocal(b)))
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num, den}) do
    reduce({Kernel.abs(num), Kernel.abs(den)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({num, den}, n) when n >= 0 do
    reduce({trunc(:math.pow(num, n)), trunc(:math.pow(den, n))})
  end

  def pow_rational({num, den}, n) when n < 0, do: pow_rational({den, num}, -n)

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num, den}) do
    :math.pow(:math.pow(x, num), 1/den)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({num, dem}) do
    divisor = Integer.gcd(num, dem)
    if dem > 0 do
      {div(num, divisor), div(dem, divisor)}
    else
      {-div(num, divisor), -div(dem, divisor)}
    end
  end
end
