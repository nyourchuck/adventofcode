# frozen_string_literal: true

class Day7 < Puzzle
  def filter
    sizes = Hash.new(0)
    path = []
    until lines.empty?
      cmd = lines.shift

      if cmd == "$ cd .."
        path.pop
      elsif cmd.start_with?("$ cd ")
        path.push cmd.split.last
      else
        size = cmd.to_i
        (1..path.length).each do |i|
          sub = path.slice(0, i).join
          sizes[sub] += size
        end
      end
    end
    sizes
  end

  def answer1
    data.values.select { |v| v <= 100_000 }.sum
  end

  def answer2
    total = 70_000_000
    needed = 30_000_000
    used = data["/"]
    space = needed - (total - used)
    data.values.select { |v| v > space }.min
  end
end
