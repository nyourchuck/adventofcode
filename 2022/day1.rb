#!/usr/bin/env ruby
# frozen_string_literal: true

require "pry"
require_relative "../lib/puzzle"

class Day1 < Puzzle
  def data
    return @data if @data

    @data = File.read(input_filename).split("\n\n")
    @data = @data.map do |entry|
      entry.split("\n").map(&:to_i)
    end
    @data
  end

  def calories
    @calories ||= data.map(&:sum).sort.reverse
  end

  def answer1
    calories.first
  end

  def answer2
    calories.slice(0, 3).sum
  end

  if __FILE__ == $PROGRAM_NAME
    input = Day1.new(:input)
    sample = Day1.new(:sample)

    puts "PART ONE"
    sample.solve1
    input.solve1

    puts "PART TWO"
    sample.solve2
    input.solve2
  end
end
