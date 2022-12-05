# frozen_string_literal: true

class Day4 < Puzzle
  def filter_line(line)
    (a, b, c, d) = line.split(/\D+/)
    [(a..b).to_a, (c..d).to_a].sort_by(&:length)
  end

  def answer1
    data.select! { |a, b| (a - b).empty? }
    count
  end

  def answer2
    data.reject! { |a, b| a.intersection(b).empty? }
    count
  end
end
