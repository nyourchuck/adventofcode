# frozen_string_literal: true

class Day2 < Puzzle
  def filter_line(line)
    line.split
  end

  def tools
    @tools ||= "ABC".chars
  end

  def round_score_v1(play)
    score = case play.join
            when "AX", "BY", "CZ"
              3
            when "AZ", "BX", "CY"
              0
            when "AY", "BZ", "CX"
              6
            end

    score + tool_score(play[1])
  end

  def tool_score(tool)
    if tool > "C"
      tool_score (tool.ord - 23).chr
    else
      tools.index(tool) + 1
    end
  end

  def round_score_v2(play)
    case play[1]
    when "X"
      0 + tool_score(lose(play[0]))
    when "Y"
      3 + tool_score(draw(play[0]))
    when "Z"
      6 + tool_score(win(play[0]))
    end
  end

  def lose(tool)
    tools[tools.index(tool) - 1]
  end

  def win(tool)
    tools[(tools.index(tool) + 1) % 3]
  end

  def draw(tool)
    tool
  end

  def answer1
    data.map { |d| round_score_v1(d) }.sum
  end

  def answer2
    data.map { |d| round_score_v2(d) }.sum
  end
end
