#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day12 < Puzzle

  class Day12Node < Node
    def neighbors
      @neighbors ||= []
    end
  end

  def filter
    build_grid(Day12Node)
    lines.map(&:chomp).each do |l|
      (a,b) = l.split('-').map(&:to_sym)
      if a != :end && b != :start
        grid[a].neighbors.push b
      end
      if a != :start && b!= :end
        grid[b].neighbors.push a
      end
    end
  end

  def big?(cave)
    cave.upcase == cave
  end

  def add_paths(key, paths)
    return paths if key == :end
    paths.each do |path|
      grid[key].neighbors.each do |cave|
        if big?(cave) || !path.include?(cave)
          new_path = path + [cave]
          paths += add_paths(cave, [new_path])
        end
      end
    end
    paths
  end

  def add_paths2(key, paths)
    return paths if key == :end
    paths.each do |path|
      grid[key].neighbors.each do |cave|
        if big?(cave)
          paths += add_paths2(cave, [path])
        else
          counts = path[cave] || 0
          if counts >= 1
            next if path[:small_cave] == 2
            new_path = path.dup
            new_path[:small_cave] = 2
          else
            new_path = path.dup
          end
          new_path[cave] = counts + 1
          paths += add_paths2(cave, [new_path])
        end
      end
    end
    paths
  end

  def answer1
    filter
    x = add_paths(:start, [[:start]])
    x.find_all { |p| p.last == :end }.length
  end

  def answer2
    filter
    x = add_paths2(:start, [{start: 1}])
    x.find_all { |p| p[:end] == 1 }.length
  end
end

if __FILE__==$0
  input = Day12.new(:input)
  sample = Day12.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
