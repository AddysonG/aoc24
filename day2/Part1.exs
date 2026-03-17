defmodule Part1 do
  def main do
    [in_file] = System.argv()

    in_file
    |> parse()
    |> solve()
    |> IO.puts()
  end

  def parse(in_file) do
    in_file
    |> File.stream!()
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
  end

  def solve(input) do
    input |> Enum.count(fn row -> is_safe?(row) end)
  end

  defp is_safe?([first, second | remainder]) do
    direction = if first < second do
      :increasing
    else
      :decreasing
    end
    is_safe?([second | remainder], first, direction)
  end

  defp is_safe?([], _prev, _direction), do: true

  defp is_safe?([h | t], prev, direction) do
    cond do
      abs(prev - h) > 3 -> false
      direction == :increasing and h <= prev -> false
      direction == :decreasing and h >= prev -> false
      true -> is_safe?(t, h, direction)
    end
  end
end

Part1.main()
