#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day20 < Puzzle

  class Day20Grid < Grid
    attr_accessor :default_pixel
    attr_accessor :enhance_pixels

    def initialize(enhance_pixels)
      super()
      self.default_pixel = 0
      self.enhance_pixels = enhance_pixels.split('').map { |p| p == "#" ? 1 : 0 }
    end

    def at(key)
      self[key] || Day20Node.new(key, self, default_pixel)
    end

    def enhance
      pixels = values.map { |v| v.neighbors }.flatten.uniq
      pixels.each { |p|
        p.enhance(enhance_pixels[p.enhance_index])
      }
      clear
      pixels.each { |p|
        self[p.key] = p
        p.reset
      }
      self.default_pixel = default_pixel == 1 ? enhance_pixels[511] : enhance_pixels[0]
    end

    def count_pixels
      values.map(&:value).sum
    end
  end

  class Day20Node < Node
    attr_accessor :value, :new_value, :original

    def initialize(key, grid, value)
      super(key, grid)
      self.value = value
      grid[key] = self
      self.original = original
    end

    def enhance_index
      neighbors.inject(0) { |sum, i| (sum << 1) | i.value }
    end

    def neighbors
      [
        at(-1,-1), at(0,-1), at(1, -1),
        at(-1,0), self, at(1,0),
        at(-1,1), at(0,1), at(1,1)
      ]
    end
 
    def to_s
      "#{key}:#{value}"
    end

    def inspect
      to_s
    end

    def enhance(new_value)
      self.new_value = new_value
    end

    def reset
      self.value = new_value
      self.new_value = nil
    end
  end

  def filter
    @grid = Day20Grid.new(lines.first.chomp)
    lines.each_with_index { |l, i|
      next if i < 2
      y = i - 2
      l.chomp.split('').each_with_index { |c, x|
        bit = c == "#" ? 1 : 0
        Day20Node.new([x,y], grid, bit)
      }
    }
  end

  def answer1
    filter
    2.times do |i|
      grid.enhance
    end

    grid.count_pixels
  end

  def answer2
    filter
    50.times do |i|
      grid.enhance
    end

    grid.count_pixels
  end

end

if __FILE__==$0
  input = Day20.new(:input)
  sample = Day20.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  # guesses: 6466 (too high)

  puts "PART TWO"
  sample.solve2
  input.solve2
end
