#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day11 < Puzzle

  class Node
    attr_accessor :x
    attr_accessor :y
    attr_accessor :grid
    attr_accessor :value

    def initialize(grid, x, y, value)
      self.grid = grid
      self.x = x
      self.y = y
      self.value = value
      grid[[x,y]] = self
    end
       
    def at(x1, y1)
      grid[[x + x1, y + y1]]
    end

    def neighbors
      @neighbors ||= [
        at(0,1), at(0, -1), at(1, 0), at(-1,0),
        at(-1,1), at(-1,-1), at(1,1), at(1,-1)
      ].compact
    end

    def flash
      neighbors.each { |n| n.increase }
    end

    def increase
      self.value += 1
      flash if value == 10
    end
  end

  def filter
    grid = Hash.new
    lines.each_with_index { |line, y|
       line.chomp.split('').map(&:to_i).each_with_index { |n, x|
         node = Node.new(grid, x, y, n)
       }
    }
    grid
  end

  def answer1
    flashes = 0
    (1..100).each do |i|
      data.values.each { |v| v.increase }
      flashers = data.values.find_all { |v| v.value > 9 }
      flashes += flashers.count
      flashers.each { |f| f.value = 0 }
    end
    flashes
  end

  def answer2
    (1..1000).each do |i|
      data.values.each { |v| v.increase }
      flashers = data.values.find_all { |v| v.value > 9 }
      if flashers.count == data.values.count
        return i
      end
      flashers.each { |f| f.value = 0 }
    end
  end
end

if __FILE__==$0
  input = Day11.new(:input)
  sample = Day11.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
