# frozen_string_literal: true

require_relative "puzzle"

class Minimal < Puzzle
  def pr(command_string)
    commands = command_string.split
    register1 = File.read(input_filename)
    commands.each do |command|
      register1 = do_command(command, register1)
    end
    register1
  end

  def do_command(command, register)
    case command.slice(0)
    when "G"
      group(register, command)
    when "s"
      sum(register)
    when "H"
      highest(register, command)
    when "M"
      register.map { |item| do_command(command.slice(1, 5), item) }
    end
  end

  def highest(register, command)
    if command == "H"
      register.sort.reverse.first
    else
      register.sort.reverse.slice(0, command.slice(1, 5).to_i)
    end
  end

  def sum(group)
    if group.instance_of?(String)
      group = group.split(/\s+/)
    end
    group.map(&:to_i).sum
  end

  def group(register, command)
    if command == "Gnn"
      register.split("\n\n")
    else
      register.split(/\s+/)
    end
  end
end
