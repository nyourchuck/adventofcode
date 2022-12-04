#!/usr/bin/env ruby
# frozen_string_literal: true

require "pry"
require_relative "../../lib/minimal"

class MinimalDay1 < Minimal
  def answer1
    pr "Gnn sum H"
  end

  def answer2
    pr "Gnn sum H3 sum"
  end

  if __FILE__ == $PROGRAM_NAME
    input = MinimalDay1.new(:input, :day1)
    sample = MinimalDay1.new(:sample, :day1)

    puts "PART ONE"
    sample.solve1
    input.solve1

    puts "PART TWO"
    sample.solve2
    input.solve2
  end
end
