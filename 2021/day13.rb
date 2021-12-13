#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day13 < Puzzle

  def filter
    folds = []
    build_grid
    lines.each_with_index { |line, y|
       if line.start_with?("fold")
         folds.push line.split(' ').last.split('=') 
       else
         point = integers(line)
         grid[point].value = '#'
       end
    }
    folds
  end

  def fold(axis, value)
    grid.keys.each do |key|
      node = grid[key]
      if axis == 'y'
        if key[1] > value
          new_key = [key[0], value - (key[1] - value)]
          node.new_key(new_key)
        end
      else
        if key[0] > value
          new_key = [value - (key[0] - value), key[1]]
          node.new_key(new_key)
        end
      end
    end
    
  end

  def answer1
    filter
    f = data.first
    fold(f[0], f[1].to_i)
    grid.values.count
  end

  def answer2
    filter
    data.each { |f|
      fold(f[0], f[1].to_i)
    }
    grid.visualize
  end

end

if __FILE__==$0
  input = Day13.new(:input)
  sample = Day13.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
