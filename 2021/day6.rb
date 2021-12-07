#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day6 < Puzzle

  def filter
    lines.first.split(',').map(&:to_i)
  end

  def answer1
    (1..80).each do |day|
      data.map! { |f| f == 0 ? [ 6, 8] : (f - 1) }
      data.flatten!
    end

    data.count
  end

  def answer2
    total = (0..8).to_a.map { |i| data.find_all { |n| n == i }.count }

    (1..256).each do |day|
      total.append(total.shift)
      total[6] += total[8]
    end
    total.sum
  end

if __FILE__==$0
  input = Day6.new(:input)
  sample = Day6.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
  end
end
