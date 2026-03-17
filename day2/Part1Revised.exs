defmodule Part1Revised do
  def main do
    [in_file] = System.argv()

    in_file
    |> parse()
    |> solve()
    |> IO.puts()
  end

  defp parse(in_file) do
    in_file
    |> File.stream!()
    |> Stream.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp solve(input) do
    input |> Enum.count(&is_safe?/1)
  end

  defp is_safe?([first, second | remainder]) do
    direction = if first < second, do: :increasing, else: :decreasing
    is_safe?([second | remainder], first, direction)
  end

  defp is_safe?([], _prev, _direction), do: true

  defp is_safe?([h | _t], prev, _direction) when abs(prev - h) > 3, do: false
  defp is_safe?([h | _t], prev, :increasing) when h <= prev, do: false
  defp is_safe?([h | _t], prev, :decreasing) when h >= prev, do: false

  defp is_safe?([h | t], _prev, direction), do: is_safe?(t, h, direction)
end

Part1Revised.main()
