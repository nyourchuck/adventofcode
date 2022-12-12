#!/usr/bin/env ruby
# frozen_string_literal: true

require 'pry-byebug'

Dir["./lib/*.rb"].sort.each { |file| require file }
Dir["./lib/**/*.rb"].sort.each { |file| require file }

puzzle_name = ARGV[0]
puzzle_solver = Object.const_get(puzzle_name)
puzzle_name =~ /(Day\d+)/
puzzle_data = Regexp.last_match(1).downcase

puts puzzle_solver

input = puzzle_solver.new(:input, puzzle_data)
sample = puzzle_solver.new(:sample, puzzle_data)

puts "PART ONE"
sample.solve1
input.solve1

input = puzzle_solver.new(:input, puzzle_data)
sample = puzzle_solver.new(:sample, puzzle_data)

puts "PART TWO"
sample.solve2
input.solve2
