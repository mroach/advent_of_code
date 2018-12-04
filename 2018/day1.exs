#!/usr/bin/env elixir

# Strategy here:
# Read the whole file as a single string, split the lines, parse each line
# as an integer, remove blanks, sum them all up

defmodule Day1 do
  @starting_frequency 0

  def sum_frequencies(file_stream) do
    file_stream
    |> Stream.map(fn str ->
      case Integer.parse(str) do
        {int, _rem} -> int
        _ -> 0
      end
    end)
    |> Enum.reduce(@starting_frequency, fn num, acc -> acc + num end)
  end
end

case System.argv() do
  [input_file_path] ->
    input_file_path
    |> File.stream!([], :line)
    |> Day1.sum_frequencies
    |> IO.puts

  _ ->
    IO.puts :stderr, "expected input file path"
    System.halt(1)
end
