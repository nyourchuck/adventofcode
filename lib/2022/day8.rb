# frozen_string_literal: true

require "colorize"

class Day8 < Puzzle
  SOUTH = 1
  NORTH = SOUTH * -1
  EAST = 2
  WEST = EAST * -1

  class Tree
    attr_accessor :h

    def initialize(h, key)
      @h = h
      @key = key
    end

    def neighbors
      @neighbors ||= {}
    end

    def visible?(direction = nil)
      if direction
        all_neighbors(direction).all? { |other| other.h < h }
      else
        [SOUTH, NORTH, EAST, WEST].map { |d| visible?(d) }.any?
      end
    end

    def all_neighbors(direction)
      neighbor = neighbors[direction]
      return [] if neighbor.nil?

      [neighbor].concat neighbor.all_neighbors(direction)
    end

    def add_neighbor(direction, tree)
      if tree
        neighbors[direction] = tree
        tree.neighbors[direction * -1] = self
      end
    end

    def score
      [SOUTH, NORTH, EAST, WEST].map do |direction|
        view = []
        all_neighbors(direction).each do |n|
          view.push n
          break if n.h >= h
        end
        view.length
      end.inject(:*)
    end

    def to_s
      display = h.to_s
      if visible?
        display.green
      else
        display
      end
    end

    def inspect
      "#{@key} : #{@h}"
    end
  end

  def filter
    forest = {}
    lines.each_with_index do |line, i|
      line.chars.each_with_index do |height, j|
        tree = Tree.new(height.to_i, [i, j])
        forest[[i, j]] = tree
        tree.add_neighbor(WEST, forest[[i, j - 1]])
        tree.add_neighbor(NORTH, forest[[i - 1, j]])
      end
    end
    forest
  end

  def answer1
    data.values.select(&:visible?).count
  end

  def answer2
    data.values.map(&:score).max
  end
end
