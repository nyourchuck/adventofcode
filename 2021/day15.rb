#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day15 < Puzzle
  BIG_DISTANCE = 1_000_000

  class Day15Node < Node
    attr_accessor :distance

    def initialize(key, grid, value)
      super(key, grid)
      while value > 9
        value = value - 9
      end
      self.value = value
      grid[key] = self
    end

    def neighbors
      [at(0,1), at(0, -1), at(1, 0), at(-1,0)].compact
    end
 
    def to_s
      "#{key}:#{value}"
    end

    def translate(x1,y1, inc)
      node = Day15Node.new([x1 + key[0],y1 + key[1]],grid, value + inc) 
    end
  end

  def build_grid
    @grid = Grid.new
  end 

  def filter
    build_grid
    lines.map(&:chomp).each_with_index do |l, j|
      l.split('').map(&:to_i).each_with_index do |risk,i|
        node = Day15Node.new([i,j], grid, risk) 
      end
    end
  end

  def shortest_path(start)
    grid.values.each { |node|
      node.distance = BIG_DISTANCE
    }
    start.distance = 0
    candidates = [ start ]

    next_candidates = []
    while candidates.length > 0 do
      candidates.sort_by!(&:distance)

      # considering all candidates of the shortest length avoids re-sorting after each node
      distance = candidates[0].distance
      while candidates.length > 0 && distance == candidates[0].distance do
        next_candidates.push candidates.shift
      end

      while next_candidates.length > 0 do
        u = next_candidates.shift
        u.neighbors.each do |v|
          alt = u.distance + v.value
          if alt < v.distance
            candidates.push(v) if v.distance == BIG_DISTANCE
            v.distance = alt
          end
        end
      end
    end
  end

  def answer1
    filter
    shortest_path(grid[[0,0]])
    grid.bottom_right.distance
  end

  def answer2
    filter
    x1 = grid.max_x + 1
    y1 = grid.max_y + 1
    grid.values.each do |node|
      5.times do |x|
        5.times do |y|
          next if x == 0 && y == 0
          node.translate(x * x1, y * y1, x + y) 
        end
      end
    end
    shortest_path(grid[[0,0]])
    grid.bottom_right.distance
  end

end

if __FILE__==$0
  input = Day15.new(:input)
  sample = Day15.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
