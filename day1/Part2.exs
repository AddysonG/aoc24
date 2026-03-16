defmodule Part2 do
  def main do
    [in_file] = System.argv()

    {left, right} = parse_input(in_file)

    similarity_score = solve(left, right)

    IO.puts(similarity_score)
  end

  def parse_input(in_file) do
    in_file
    |> File.stream!()
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
  end

  def solve(left, right) do
    right_counts = Enum.frequencies(right)

    left
    |> Enum.sum_by(fn num ->
      right_frequency =
        right_counts
        |> Map.get(num, 0)

      num * right_frequency
    end)
  end
end

Part2.main()
