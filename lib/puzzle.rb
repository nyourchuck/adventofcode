# frozen_string_literal: true

class Puzzle
  attr_accessor :input_type

  def initialize(input_type)
    self.input_type = input_type
  end

  # input filenames are stored in data directory
  # example: `data/day1.sample` and `data/day1.input`
  def input_filename
    "data/#{self.class.to_s.downcase}.#{input_type}"
  end

  def lines
    @lines ||= File.open(input_filename).readlines.map(&:chomp)
  end

  def integers(string)
    string.split(/\D+/).map(&:to_i)
  end

  def data
    @data ||= filter
  end

  def solve1
    if defined? answer1
      @data = nil
      put_answer "  ANSWER1 (#{input_type}):", answer1
    else
      puts " ANSWER1 UNDEFINED"
    end
  end

  def solve2
    if defined? answer2
      @data = nil
      put_answer "  ANSWER2 (#{input_type}):", answer2
    else
      puts " ANSWER2 UNDEFINED"
    end
  end

  def put_answer(prefix, answer)
    if answer.respond_to?(:include?) && answer.include?("\n")
      puts prefix
      puts answer
    else
      puts "#{prefix} #{answer}"
    end
  end
end
