# frozen_string_literal: true

class Minimal
  attr_accessor :input_type

  def initialize(input_type, day)
    self.input_type = input_type
    @day = day
  end
  #
  # input filenames are stored in data directory
  # example: `data/day1.sample` and `data/day1.input`
  def input_filename
    "data/#{@day}.#{input_type}"
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

  def pr(command_string)
    commands = command_string.split
    register1 = File.open(input_filename).read
    commands.each do |command|
      puts command
      f = command.slice!(0)
      case f
      when "G"
        if command == "nn"
          register1 = register1.split("\n\n")
        end
      when "s"
        if command == "um"
          if register1[0].class == Integer
            register1 = register1.sum
          else
            register1 = register1.map { |group| sum(group) }
          end
        end
      when "H"
        if command.empty?
          register1 = register1.sort.reverse.first
        else
          register1 = register1.sort.reverse.slice(0, command.to_i)
        end
      end
    end
    register1
  end

  def sum(group)
    if group.class == String
      group.split(/\s+/).map(&:to_i).sum
    else
      group.map(&:to_i).sum
    end
  end
end
