class Grid < Hash
  # assumes 2d grid
  def visualize
    (0..max_y).map { |y1|
      (0..max_x).map { |x1| self[[x1, y1]].value || '·' }.join
    }.join("\n") + "\n"
  end

  def max_x
    values.map(&:x).max
  end

  def max_y
    values.map(&:y).max
  end

  def inspect
    <<~EOS
      0-#{max_x},0-#{max_y}
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
