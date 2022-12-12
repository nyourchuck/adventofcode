# frozen_string_literal: true

class Puzzle
  attr_accessor :input_type, :input_data, :lines

  def initialize(input_type, data_file = nil)
    self.input_type = input_type
    @data_file = data_file || self.class.to_s.downcase
  end

  # input filenames are stored in data directory
  # example: `data/2022/day1.sample` and `data/2022/day1.input`
  def input_filename
    "data/#{@data_file}.#{input_type}"
  end

  def datafile
    File.open(input_filename)
  end

  def lines
    @lines ||= datafile.readlines.map(&:chomp)
  end

  def filter_line(line)
    line
  end

  def filter
    lines.map { |line| filter_line(line) }
  end

  def integers(string)
    string.split(/\D+/).map(&:to_i)
  end

  def data
    @data ||= filter
  end

  def count
    data.count
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
