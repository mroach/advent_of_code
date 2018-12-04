#!/usr/bin/env ruby

# http://adventofcode.com/2017/day/8
#
# I heard you like registers
#
# Each line of input contains a modification to a register value and a pre-condition.
# Each register's value starts at 0 and is only increased or decreased
# The goal is to find the largest register value after all modifications

inputs = File.read("inputs/day8.txt").lines

# The default value for registers is 0
registers = Hash.new(0)

inputs.each do |line|
  parts = line.split(/\s+/)
  target, op, amount = parts.slice(0, 3) # ex: a inc 5
  compare, compop, val = parts.slice(4, 3) # ex: b >= 5

  # check the pre-condition against register's current value
  if registers[compare].send(compop, val.to_i)
    # remap the 'inc' and 'dec' to plus and minus
    op = { "inc" => :+, "dec" => :- }[op]
    # modify the register
    registers[target] = registers[target].send(op, amount.to_i)
  end
end

puts registers
puts registers.values.max
