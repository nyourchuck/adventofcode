# frozen_string_literal: true

class Day14 < Puzzle
  class Node
    attr_accessor :key, :point, :type

    def initialize(point, type = :rock)
      @point = point
      @type = type
    end

    def x
      point.x
    end

    def y
      point.y
    end
  end

  class Day14Grid < Grid
    attr_writer :lowest

    # adds a straight line to graph
    def add_line(x1, y1, x2, y2)
      if x1 > x2 || y1 > y2
        return add_line(x2, y2, x1, y1)
      end

      (x1..x2).each do |x|
        (y1..y2).each do |y|
          p = Point.new(x, y)
          add(p, Node.new(p))
        end
      end
    end

    def lowest
      @lowest ||= values.map(&:y).max
    end

    def add_sand(x, y)
      p = Point.new(x, y)
      add(p, Node.new(p, :sand))
    end

    def plop(x, y)
      if get(x, y + 1)
        if get(x - 1, y + 1)
          if get(x + 1, y + 1)
            add_sand(x, y)
          else
            plop(x + 1, y + 1)
          end
        else
          plop(x - 1, y + 1)
        end
      elsif y > lowest
        :stop
      else
        plop(x, y + 1)
      end
    end

    def plop2(x, y)
      return if y == lowest || get(x, y)

      add_sand(x, y)
      plop2(x - 1, y + 1)
      plop2(x, y + 1)
      plop2(x + 1, y + 1)
    end
  end

  def filter
    Day14Grid.new.tap do |graph|
      lines.each do |line|
        points = line.split(" -> ").map do |point|
          Point.new(point)
        end
        points.each_cons(2) do |a, b|
          graph.add_line(a.x, a.y, b.x, b.y)
        end
      end
    end
  end

  def answer1
    while data.plop(500, 0) != :stop
    end
    data.values.select { |d| d.type == :sand }.count
  end

  def answer2
    data.values.each { |n| n.type == :sand && data.remove(n.point) }
    data.lowest = data.values.map(&:y).max + 2
    data.plop2(500, 0)
    data.values.select { |d| d.type == :sand }.count
  end
end
