#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day17 < Puzzle

  # The probe's x,y position starts at 0,0. Then, it will follow some trajectory by moving in steps. On each step, these changes occur in the following order:

  # The probe's x position increases by its x velocity.
  # The probe's y position increases by its y velocity.
  # Due to drag, the probe's x velocity changes by 1 toward the value 0; that is, it decreases by 1 if it is greater than 0, increases by 1 if it is less than 0, or does not change if it is already 0.
  # Due to gravity, the probe's y velocity decreases by 1.

  class Probe
    attr_accessor :distance
    attr_accessor :max_y
    attr_accessor :starting

    def initialize(x,y)
      @starting = [x,y]
      @max_y = 0
      @x = 0
      @y = 0
      @xv = x
      @yv = y
    end
     
    def step
      @x += @xv
      @y += @yv
      if @xv < 0
        @xv += 1
      elsif @xv > 0
        @xv -= 1
      end
      @yv -= 1
      @max_y = [@max_y, @y].max
    end

    def hits?(x1, y1, x2, y2)
      while (@x < x2 && @y > y1)
        step
        if (@x >= x1 && @x <= x2 && @y >= y1 && @y <= y2)
          return true
        end
      end
      false
    end
  end

  def filter
    (@x1, @x2, @y1, @y2) = lines.first.chomp.split(',').map(&:to_i)
  end

  def answer1
    filter
    hits = []
    (1..500).each do |x|
      (1..500).each do |y|
        p = Probe.new(x,y)
        hits.push(p) if p.hits?(@x1, @y1, @x2, @y2)
      end
    end
    hits.sort_by(&:max_y).last.max_y
  end

  def answer2
    filter
    hits = []
    (1..500).each do |x|
      (-400..600).each do |y|
        p = Probe.new(x,y)
        hits.push(p) if p.hits?(@x1, @y1, @x2, @y2)
      end
    end
    hits.count
  end

end

if __FILE__==$0
  input = Day17.new(:input)
  sample = Day17.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
