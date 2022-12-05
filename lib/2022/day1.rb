# frozen_string_literal: true

require "pry"

class Day1 < Puzzle
  def filter
    datafile.read.split("\n\n").map do |entry|
      entry.split("\n").map(&:to_i)
    end
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
end
