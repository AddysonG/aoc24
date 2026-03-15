defmodule Part1Revised do
  def main do
    [in_file] = System.argv()

    {left, right} = parse_input(in_file)
    total_distance = solve(left, right)
    IO.puts(total_distance)
  end

  defp parse_input(in_file) do
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

  defp solve(left, right) do
    left = Enum.sort(left)
    right = Enum.sort(right)

    diff_lists(left, right)
  end

  def diff_lists(left, right), do: do_diff_lists(left, right, 0)

  defp do_diff_lists([], [], sum), do: sum

  defp do_diff_lists([lh | lt], [rh | rt], sum) do
    diff = abs(lh - rh)
    do_diff_lists(lt, rt, sum + diff)
  end
end

Part1Revised.main()
