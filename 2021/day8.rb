#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day8 < Puzzle
  def filter
    lines.map { |l| l.split('|').map(&:split) }
  end

  def answer1
    data.map { |d|
      d.last.map(&:length).select { |a| [2, 4, 3, 7].include?(a) }.count
    }.sum
  end

  def answer2
    sum = 0

    data.map { |patterns, outputs|
      mappings = {}
      patterns.map! { |p| p.split('').sort }
      mappings[1] = patterns.find { |n| n.length == 2 }
      mappings[7] = patterns.find { |n| n.length == 3 }
      mappings[4] = patterns.find { |n| n.length == 4 }
      mappings[8] = patterns.find { |n| n.length == 7 }

      # determine remaining numbers via overlap of known segments
      patterns.each do |segments|
        if segments.length == 6
          if (mappings[4] - segments).empty?
            mappings[9] = segments
          elsif (mappings[7] - segments).empty?
            mappings[0] = segments
          else
            mappings[6] = segments
          end
        end
      end

      patterns.each do |segments|
        if segments.length == 5
          if (mappings[1] - segments).empty?
            mappings[3] = segments
          elsif (segments - mappings[9]).empty?
            mappings[5] = segments
          else
            mappings[2] = segments
          end
        end
      end

      digits = outputs.map { |d|
        numbers = d.split('').sort
        mappings.keys.find { |key| mappings[key] == numbers }
      }
      sum += digits.join.to_i
    }
    sum
  end

if __FILE__==$0
  input = Day8.new(:input)
  sample = Day8.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
  end
end
