# frozen_string_literal: true

class Day11 < Puzzle
  MONKEYS = []

  class Monkey
    attr_accessor :items, :inspections, :test, :worry, :op

    def initialize(items, operation, test, m1, m2)
      @inspections = 0
      @items = items
      @op = operation
      @test = test
      @m1 = m1
      @m2 = m2
    end

    def inspect(item)
      @inspections += 1
      @worry.call(item)
    end

    def toss(item)
      item % @test == 0 ? @m1 : @m2
    end

    def process(monkeys)
      @items.each do |old|
        new = inspect(old)
        monkeys[toss(new)].items.push new
      end
      @items = []
    end
  end

  def filter
    monkeys = []
    groups = File.read(input_filename).split("\n\n")
    groups.each do |data|
      (id, items, op, test, m1, m2) = data.split("\n").map {|i| i.gsub(/.*\:/,'') }
      monkey = Monkey.new(
        items.split(':').last.split(',').map(&:to_i),
        op,
        test.split.last.to_i,
        m1.split.last.to_i,
        m2.split.last.to_i
      )
      monkeys.push monkey
    end
    monkeys
  end

  def monkeys
    data
  end

  def solve(count, op2)
    monkeys.each do |monkey|
      monkey.worry = eval("lambda { |old| (#{monkey.op}) #{op2} }")
    end

    count.times do
      monkeys.each do |monkey|
        monkey.process(monkeys)
      end
    end
    monkeys.map(&:inspections).sort.reverse.slice(0,2).inject(:*)
  end

  def answer1
    solve(20, "/ 3")
  end

  def answer2
    mods = data.map(&:test).inject(:*)
    solve(10_000, "% #{mods}")
  end
end
