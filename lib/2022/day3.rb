# frozen_string_literal: true

class Day3 < Puzzle
  def filter
    lines.map(&:chars)
  end

  def priority(item)
    code = item.ord
    if code >= 97
      code - 97 + 1
    else
      code - 65 + 27
    end
  end

  def answer1
    commons = data.map do |data|
      a = data.slice!(0, data.length / 2)
      priority a.intersection(data).first
    end
    commons.sum
  end

  def answer2
    priorities = 0
    while data.any?
      (a, b, c) = data.slice!(0, 3)
      badge = a.intersection(b).intersection(c).first
      priorities += priority(badge)
    end
    priorities
  end
end
