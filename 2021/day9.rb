#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day9 < Puzzle

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
      [at(0,1), at(0, -1), at(1, 0), at(-1,0)].compact
    end

    def fill
      if value == 9
        0
      else
        self.value = 9
        1 + neighbors.map(&:fill).sum
      end
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
    data.values.map { |point|
      if point.neighbors.find { |n| n.value <= point.value }
        0
      else
        point.value + 1
      end
    }.sum
  end

  def answer2
    basins = data.values.map(&:fill)
    (a,b,c) = basins.sort.reverse.slice(0,3)
    a * b * c
  end
end

if __FILE__==$0
  input = Day9.new(:input)
  sample = Day9.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
