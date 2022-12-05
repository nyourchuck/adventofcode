# frozen_string_literal: true

class Day5 < Puzzle
  def filter
    (crates, moves) = datafile.read.split("\n\n")
    crates = crates.split("\n")
    indexes = crates.pop.split("   ").map(&:to_i)

    crates = crates.map do |row|
      indexes.map { |i| row[i * 4 - 3] }
    end

    moves = moves.split("\n")
    moves = moves.map { |m| m.split(/\D+/).map(&:to_i).slice(1,3) }

    stacks = Hash.new {|h,k| h[k] = Array.new }
    crates.each do |line|
      line.each_with_index do |crate, index|
        next if crate == " "
        stacks[index + 1].unshift crate
      end
    end
    [stacks, moves]
  end

  def answer1
    (stacks, moves) = filter
    moves.each do |a, b, c|
      a.times do
        stacks[c].push(stacks[b].pop)
      end
    end
    stacks.keys.sort.map { |k| stacks[k].last }.join
  end

  def answer2
    (stacks, moves) = filter
    moves.each do |a, b, c|
      stacks[c].concat(stacks[b].slice!(-1 * a, a))
    end
    stacks.keys.sort.map { |k| stacks[k].last }.join
  end
end
