defmodule Part1 do
  def main() do
    [in_file] = System.argv()

    [left, right] = in_file
      |> File.stream!()
      |> Enum.map(fn line -> line
        |> String.split()
        |> Enum.map(&String.to_integer/1)
      end )
      |> Enum.zip()

    left = left |> Tuple.to_list() |> Enum.sort()
    right = right |> Tuple.to_list() |> Enum.sort()

    diff_lists(left, right) |> IO.inspect()
  end

  def diff_lists(left, right), do: do_diff_lists(left, right, [])

  defp do_diff_lists([], [], paired), do: paired |> Enum.sum()

  defp do_diff_lists([l_head | l_tail], [r_head | r_tail], paired) do
    diff = l_head - r_head |> abs()
    do_diff_lists(l_tail, r_tail, [diff | paired])
  end
end

Part1.main()
