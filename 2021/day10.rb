#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day10 < Puzzle

  BRACKETS = ["[]", "{}", "()", "<>"]
  POINTS = {
    ")" => 3,
    "]" => 57,
    "}" => 1197,
    ">" => 25137
  }

  POINTS2 = {
    ")" => 1,
    "]" => 2,
    "}" => 3,
    ">" => 4 
  }

  def filter
    lines.map { |l| l.chomp.split('') }
  end

  def closing(char)
    BRACKETS.find { |m| m.start_with?(char) }[1]
  end

  def starter?(char)
    BRACKETS.find { |m| m.start_with?(char) }
  end

  def answer1
    corrupt = []
    data.each do |row|
      opens = []
      row.each { |c|
        if starter?(c)
          opens.push(c)
        else
          if closing(opens.pop) != c
            corrupt.push c
            break
          end
        end
      }
    end
    corrupt.map { |c| POINTS[c] }.sum
  end

  def answer2
    endings = []
    data.each do |row|
      opens = []
      row.each do |c|
        if starter?(c)
          opens.push(c)
        else
          if closing(opens.pop) != c
            throw "corrupt"
          end
        end
      end
      endings.push opens.map { |o| POINTS2[closing(o)] }.reverse
    rescue
      next
    end
    scores = endings.map { |e| e.inject(0) { |score, n| score * 5 + n } }
    scores.sort[scores.length/2]
  end
end

if __FILE__==$0
  input = Day10.new(:input)
  sample = Day10.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
