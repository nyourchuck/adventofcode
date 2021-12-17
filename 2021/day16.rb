#!/usr/bin/env ruby

require 'pry'
require_relative '../lib/puzzle'

class Day16 < Puzzle
  class Packet
    attr_accessor :header
    attr_accessor :length
    attr_accessor :length_type

    def self.consume_next!(binary)
      Packet.new(binary.slice!(0,6)).tap { |packet|
        packet.consume! binary
      }
    end

    def initialize(header)
      self.header = header
    end

    def consume!(string)
      if literal?
        calc_value!(string)      
      else
        @length = calc_length(string)
        consume_values!(string)
      end
    end

    def version
      @version ||= header.slice(0,3).to_i(2)      
    end

    def type_id
      @type ||= header.slice(3,3).to_i(2)      
    end

    def value 
      @value
    end

    def calc_value!(string)
      digits = "" 
      while string.start_with?("1")
        digits += string.slice!(0,5)
      end
      digits += string.slice!(0,5)
      @value = digits.chars.each_slice(5).map(&:join).map { |d| d.slice(1,4) }.join.to_i(2)
    end

    def operator?
      type_id != 4
    end

    def literal?
      type_id == 4
    end

    def calc_length(binary)
      @length_type = binary.slice!(0,1)
      if length_type == "0"
        binary.slice!(0,15).to_i(2)
      else
        binary.slice!(0,11).to_i(2)
      end
    end

    def consume_values!(string)
      if length_type == "0"
        @value = string.slice!(0, length)
        subs = @value.dup
        while subs.length > 0
          subpackets.push Packet.consume_next!(subs)
        end
      else
        length.times do |i|
          subpackets.push Packet.consume_next!(string)
        end
      end

      def calculate_subpackets
        subpackets.map(&:calculate)
      end

      def calculate
        return value if literal?

        case type_id.to_i
        when 0
          calculate_subpackets.sum
        when 1
          calculate_subpackets.inject(1) { |p, i| p * i }
        when 2
          calculate_subpackets.min
        when 3
          calculate_subpackets.max
        when 5
          (a, b) = calculate_subpackets
          a > b ? 1 : 0
        when 6
          (a, b) = calculate_subpackets
          a < b ? 1 : 0
        when 7
          (a, b) = calculate_subpackets
          a == b ? 1 : 0
        end
      end
    end

    def subpackets
      @subpackets ||= []
    end

    def version_sum
      version + subpackets.map(&:version_sum).sum
    end
  end

  def binary(hex)
    hex.split('').map { |h| h.to_i(16).to_s(2).rjust(4, '0') }.join
  end


  def filter
    build_grid
    lines.map(&:chomp).each_with_index do |l, j|
      l.split('').map(&:to_i).each_with_index do |risk,i|
        node = Day16Node.new([i,j], grid, risk) 
      end
    end
  end

  def answer1
    packet = Packet.consume_next!(binary(lines.first.dup))
    packet.version_sum
  end

  def answer2
    packet = Packet.consume_next!(binary(lines.first.dup))
    packet.calculate
  end
end

if __FILE__==$0
  input = Day16.new(:input)
  sample = Day16.new(:sample)

  puts "PART ONE"
  sample.solve1
  input.solve1

  puts "PART TWO"
  sample.solve2
  input.solve2
end
