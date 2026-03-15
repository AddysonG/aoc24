# Advent of Code 2024 - Elixir

My solutions for Advent of Code 2024 problems. I'm doing these to help myself better learn and practice Elixir. Each day has it's own directory, with separate solution files for part 1 and part 2 (and sometimes revised versions).

## Structure

Each day has it's own directory (e.g. `day1`) and then separate solutions `Part1.exs` and `Part2.exs`. There will often be revised versions as well. As per Advent of Code rules, all puzzle inputs are gitignore'd.

## Running Solutions

For easier testing with different inputs, the solutions read the input file name from `argv`. Typically I keep separate `example.txt` and `input.txt` files when working on my solution for easy testing, and run a command like this:

```bash
# Inside .../aoc24/day1/
elixir Part1.exs example.txt
```

## Revised Solutions

For earlier exercises, I'm using AI feedback for my code **after I solve the exercise**. I still must work through the entire problem and claim the star without any AI usage to help me solve the problem, but I am allowing myself to use AI feedback after the initial solution to learn how to improve my code in terms of efficiency and style. In this situation, the original solution is kept intact, and I keep a separate file for post-feedback revisions to my solution.
