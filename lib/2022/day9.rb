# frozen_string_literal: true

class Day9 < Puzzle
  def filter
    lines.map(&:split)
  end

  class Point
    attr_accessor :x, :y
   
    def initialize(x,y)
      @x = x
      @y = y
    end
    
    def move(x,y)
      @x += x
      @y += y
    end

    def key
      [@x,@y].to_s
    end

    def catchup(other)
      if (other.x - x).abs > 1 || (other.y - y).abs > 1
        @y = closer(y, other.y)
        @x = closer(x, other.x)
      end
    end

    def closer(a,b)
      case a - b
      when -1, -2
        a + 1
      when 1, 2
        a - 1
      else
        a
      end
    end
  end

  def simulate(knot_count)

    knots = (0...12).to_a.map { Point.new(0,0) }
    knots = knots.slice(0,knot_count +1)
    head = knots[0]
    points = {}

    data.each do |a,b|
      b.to_i.times do 
        case a
        when "R"
          head.move(1,0)
        when "U"
          head.move(0,1)
        when "L"
          head.move(-1,0)
        when "D"
          head.move(0,-1)
        else
          puts "OOPS"
        end
        (1..knot_count).each do |i|
          knots[i].catchup(knots[i-1])
        end  
        points[knots[knot_count].key] = true
      end
    end
    if points.keys.count < 20
      puts points.keys.join(':')
    end
    puts knots.count
    points.keys.count
  end

  def answer1
    simulate(1)
  end

  def answer2
    simulate(9)
  end
end
