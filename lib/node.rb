class Node
  attr_accessor :key
  attr_accessor :grid
  attr_accessor :value

  def initialize(key, grid)
    self.key = key
    self.grid = grid
  end

  def x
    @x ||= key[0]
  end

  def y
    @y ||= key[1]
  end

  def at(x1, y1)
    grid[[x + x1, y + y1]]
  end
end
