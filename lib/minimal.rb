# frozen_string_literal: true

require_relative 'puzzle'

class Minimal < Puzzle
  def pr(command_string)
    commands = command_string.split
    register1 = File.open(input_filename).read
    commands.each do |command|
      register1 = do_command(command, register1)
    end
    register1
  end

  def do_command(command, register)
    case command.slice(0)
    when "G"
      if command == "Gnn"
        register.split("\n\n")
      end
    when "s"
      sum(register)
    when "H"
      if command == "H"
        register.sort.reverse.first
      else
        register.sort.reverse.slice(0, command.slice(1,5).to_i)
      end
    when "M"
      register.map { |item| do_command(command.slice(1, 5), item) }
    end
  end

  def sum(group)
    if group.class == String
      group = group.split(/\s+/)
    end
    group.map(&:to_i).sum
  end
end
