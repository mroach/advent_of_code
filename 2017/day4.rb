#!/usr/bin/env ruby

# http://adventofcode.com/2017/day/4
#
# High-Entropy Passphrases
#
# "A passphrase consists of a series of words (lowercase letters) separated by spaces.
# To ensure security, a valid passphrase must contain no duplicate words."

inputs = File.read("inputs/day4.txt").lines

# if the number of words is equal to the number of unique words, they're all unique
# and it's valid
def is_valid?(line)
  words = line.split(/\s+/)
  words.length == words.uniq.length
end

puts inputs.select { |i| is_valid?(i) }.length
