# frozen_string_literal: true

class Day14 < Puzzle
  class Node
    attr_accessor :key, :x, :y, :type
    def initialize(x,y, type = :rock)
      @x = x
      @y = y
      @type = type
    end
  end
  
  class Day14Graph < Graph
    attr_accessor :lowest
    # adds a straight line to graph
    def add_line(x1,y1,x2,y2)
      if x1 > x2 || y1 > y2
        return add_line(x2,y2,x1,y1)
      end

      (x1..x2).each do |x|
        (y1..y2).each do |y|
          add(x,y, Node.new(x,y))
        end
      end
    end
    
    def lowest
      @lowest ||= values.map {|n| n.y }.sort.last
    end

    def add_sand(x,y)
      add(x,y, Node.new(x,y,:sand))
    end

    def plop(x,y)
      if get(x,y+1) 
        if get(x-1,y+1)
          if get(x+1,y+1)
            add_sand(x,y)
          else
            plop(x+1,y+1)
          end
        else
          plop(x-1,y+1)
        end
      else
        if y > lowest
          :stop
        else
          plop(x,y+1)
        end
      end
    end

    def plop2(x,y)
      return if y == lowest || get(x,y)
      add_sand(x,y)
      plop2(x-1, y+1)
      plop2(x, y+1)
      plop2(x+1, y+1)
    end
  end

  def filter
    Day14Graph.new.tap do |graph|
      lines.each do |line|
        pairs = line.split(' -> ').map { |point|
          point.split(',').map(&:to_i)
        }
        pairs.each_cons(2) { |a,b|
          (x1,y1) = a
          (x2,y2) = b
          graph.add_line(x1,y1,x2,y2)
        }
      end
    end
  end


  def answer1
    while data.plop(500,0) != :stop
    end
    data.values.select { |d| d.type == :sand }.count
  end

  def answer2
    data.values.each { |n| n.type == :sand && data.remove(n.key) }
    data.lowest = data.values.map {|n| n.y }.sort.last + 2
    data.plop2(500,0)
    data.values.select { |d| d.type == :sand }.count
  end
end
