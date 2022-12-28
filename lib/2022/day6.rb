# frozen_string_literal: true

class Day6 < Puzzle
  def filter
    lines.first.chars
  end

  def answer1(size: 4)
    index = 0
    while index < data.length
      if data.slice(index, size).uniq.length == size
        return index + size
      end

      index += 1
    end
  end

  def answer2
    answer1(size: 14)
  end
end
