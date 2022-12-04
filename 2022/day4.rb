#!/usr/bin/env ruby
# frozen_string_literal: true

require "pry"
require_relative "../lib/puzzle"

class Day4 < Puzzle
  def filter
    lines.map do |line|
      (a, b, c, d) = line.split(/\D+/)
      [(a..b).to_a, (c..d).to_a].sort_by(&:length)
    end
  end

  def answer1
    data.select { |a, b| (a - b).empty? }.count
  end

  def answer2
    data.reject { |a, b| a.intersection(b).empty? }.count
  end

  if __FILE__ == $PROGRAM_NAME
    input = new(:input)
    sample = new(:sample)

    puts "PART ONE"
    sample.solve1
    input.solve1

    puts "PART TWO"
    sample.solve2
    input.solve2
  end
end
