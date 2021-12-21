class Grid < Hash
  # assumes 2d grid
  def visualize
    (min_x..max_y).map { |y1|
      (min_y..max_x).map { |x1|
        (self[[x1, y1]] && self[[x1, y1]].value) || '·'
      }.join
    }.join("\n") + "\n"
  end

  def at(key)
    self[key]
  end

  def max_x
    values.map(&:x).max
  end

  def max_y
    values.map(&:y).max
  end

  def min_x
    values.map(&:x).min
  end

  def min_y
    values.map(&:y).min
  end

  def inspect
    <<~EOS
      #{min_x}-#{max_x},#{min_y}-#{max_y}
      #{visualize}
    EOS
  end 

  def to_s
    inspect
  end

  #assuming rectangular grid
  def bottom_right
    @bottom_right ||= self[[max_x,max_y]]
  end

end
