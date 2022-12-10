# frozen_string_literal: true

class Day10 < Puzzle
  REGISTERS = [20, 60, 100, 140, 180, 220] 

  def filter
    ticks = lines.map(&:split).flatten.map(&:to_i)
    ticks.map.with_index { |n,i| 1 + ticks.slice(0,i).sum }.unshift 0
  end

  def answer1
    REGISTERS.map { |i| data[i] * i }.sum
  end

  def answer2
    REGISTERS.map { |r|
      data.slice(r-19, 40).map.with_index { |x, i|
        (x-i).abs <= 1 ? "#" : "."
      }.join
    }.join("\n")
  end
end
