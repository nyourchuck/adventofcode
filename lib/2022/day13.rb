# frozen_string_literal: true

require 'json'

class Day13 < Puzzle

  def filter
    lines.reject(&:empty?).map { |l| JSON.parse(l) }
  end

  def compare(a, b)
#    puts "#{a},#{b} : #{a.class} : #{b.class}"
    case [a.class, b.class]
    when [Integer, Integer]
      a <=> b
    when [Array, Array]
      if a.empty? || b.empty?
        return a.length <=> b.length
      end
      a = a.dup
      b = b.dup
      compare = compare(a.shift, b.shift)
      compare == 0 ? compare(a,b) : compare
    when [Integer, Array]
      compare([a], b)
    when [Array, Integer]
      compare(a, [b])
    else
      0
    end
  end

  def orders
    data.each_slice(2).map { |p| compare(p[0],p[1]) }
  end

  def valid_pairs
    orders.map.with_index { |p, i| p < 0 ? i + 1 : nil }.compact
  end


  def answer1
    valid_pairs.sum
  end

  def answer2
    key1 = [[2]]
    key2 = [[6]]
    elements = data.concat [key1, key2]
    sorted = elements.sort { |a,b| compare(a,b) }
    (sorted.index(key1) + 1) * (sorted.index(key2) + 1)
  end
end
