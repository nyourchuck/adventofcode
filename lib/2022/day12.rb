# frozen_string_literal: true

class Day12 < Puzzle
  class Node
    attr_accessor :point, :height, :label, :key

    def paths
      @paths ||= {}
    end

    def initialize(point, label)
      @point = point
      if label == 'S'
        self.height = 'a'.ord
      elsif label == 'E'
        self.height = 'z'.ord
      else
        self.height = label.ord
      end
      self.label = label
    end

    def can_move?(neighbor)
      neighbor.height <= height + 1
    end
  end

  def filter
    Grid.new.tap do |grid|
      lines.each_with_index do |line, i|
        line.split('').each_with_index do |square, j|
          p = Point.new(i,j)
          grid.add(p, Node.new(p, square))
        end
      end
    end
  end

  def reconstruct_path(came_from, current)
    total_path = [current]
    while came_from[current]
      current = came_from[current]
      total_path.unshift current
    end
    total_path
  end

  def build_path(start, goal)
    open_set = [start]
    came_from = {}
    g_score = Hash.new(999_999)
    g_score[start] = 0

    while open_set.any?
      current = open_set.shift
      if current == goal
        return reconstruct_path(came_from, current)
      end

      data.neighbors.(current).dup.each do |n|
        next if !current.can_move?(n)
        new_score = g_score[current] + 1
        if new_score < g_score[n]
          came_from[n] = current
          g_score[n] = new_score
          if !open_set.include?(n)
            open_set.push(n)
          end
        end
      end
    end
    return []
  end

  def start
    @start ||= data.values.find { |n| n.label == 'S' }
  end

  def goal
    @goal ||= data.values.find { |n| n.label == 'E' }
  end

  def answer1
    build_path(start, goal).length - 1
  end

  def answer2
    data.values.select { |n|
      n.height == start.height
    }.select { |n|
      # only select nodes which can increase height by 1 on 1st step
      # paths starting with 'aa' are never the shortest
      data.neighbors(n).map(&:height).include?('b'.ord) 
    }.map { |choice|
      build_path(choice, goal).length - 1
    }.sort.find { |n| n > 0 }
  end
end
