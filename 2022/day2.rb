#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day2 < Puzzle
  def filter
    lines.map { |line| line.split(' ') }
  end

  def tools
    @tools ||= "ABC".split('')
  end

  def round_score_v1(play)
    score = case play.join
      when "AX", "BY", "CZ"
        3
      when "AZ", "BX", "CY"
        0
      when "AY", "BZ", "CX"
        6
      end

    score + tool_score(play[1])
  end

  def tool_score(tool)
    if tool > "C"
      tool_score (tool.ord - 23).chr
    else
      tools.index(tool) + 1
    end
  end

  def round_score_v2(play)
    case play[1]
    when "X"
      0 + tool_score(lose(play[0]))
    when "Y"
      3 + tool_score(draw(play[0]))
    when "Z"
      6 + tool_score(win(play[0]))
    end
  end

  def lose(tool)
    tools[tools.index(tool) - 1]
  end

  def win(tool)
    tools[(tools.index(tool) + 1) % 3]
  end

  def draw(tool)
    tool
  end

  def answer1
    data.map { |d| round_score_v1(d) }.sum
  end

  def answer2
    data.map { |d| round_score_v2(d) }.sum
  end

  if __FILE__==$0
    input = new(:input)
    sample = new(:sample)

    puts "PART ONE"
    sample.solve1
    input.solve1

    puts "PART TWO"
    sample.solve2
    input.solve2
  end
end
