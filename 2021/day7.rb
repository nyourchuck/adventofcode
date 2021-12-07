#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day7 < Puzzle

  def filter
    lines.first.split(',').map(&:to_i).sort
  end

  def answer1
    fuels = (data.min..data.max).map do |i|
      data.map { |p| (i - p).abs }.sum
    end

    fuels.min
  end

  # original fuel calculation
  def fuel2_slow(distance)
    (1..distance).to_a.sum
  end

  # optimized fuel calculation
  def fuel2(distance)
    (1 + distance) * (distance / 2) + (distance.odd? ? (distance / 2) + 1 : 0 )
  end

  def answer2
    fuels = (data.min..data.max).map do |i|
      data.map { |p| fuel2((i - p).abs) }.sum
    end

    fuels.min
  end

if __FILE__==$0
  input = Day7.new(:input)
  sample = Day7.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
  end
end
