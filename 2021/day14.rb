#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day14 < Puzzle

  def rules
    @rules ||= {}
  end

  def filter
    @template = lines[0].split('')

    lines.map { |l|
      if l.include?('->')
        (a,b) = l.split(' -> ')
        rules[a] = b
      end
    }
  end

  def answer1(iterate = 10)
    filter
    polymer = @template
    iterate.times do |i|
      next_p = []
      polymer.each_cons(2) do |pair|
        insert = rules[pair.join]
        next_p.push pair[0]
        next_p.push insert
      end
      next_p.push polymer.last
      polymer = next_p
    end
    stats = Hash.new(0)
    polymer.each do |c|
      stats[c] += 1
    end 

    sorted = stats.values.sort
    sorted.last - sorted.first
  end

  def answer2(iterate = 40)
    filter
    counts = Hash.new(0)
    stats = Hash.new(0)
    @template.each_cons(2) do |pair|
      counts[pair.join] += 1
      stats[pair[0]] += 1
    end
    stats[@template.last] += 1
    
    iterate.times do |i|
      new_counts = Hash.new(0)
      counts.each_pair do |pair, count|
        insert = rules[pair]
        new_counts[pair[0] + insert] += count
        new_counts[insert + pair[1]] += count
        stats[insert] += count
      end
      counts = new_counts 
    end
         
    sorted = stats.values.sort
    sorted.last - sorted.first
  end

end

if __FILE__==$0
  input = Day14.new(:input)
  sample = Day14.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
