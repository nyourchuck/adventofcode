class Node
  attr_accessor :x
  attr_accessor :y
  attr_accessor :grid
  attr_accessor :value

  def initialize(grid, x, y, value)
    self.grid = grid
    self.x = x
    self.y = y
    self.value = value
    grid[[x,y]] = self
  end
     
  def at(x1, y1)
    grid[[x + x1, y + y1]]
  end

  def neighbors
    [at(0,1), at(0, -1), at(1, 0), at(-1,0)].compact
  end

  def fill
    if value == 9
      0
    else
      self.value = 9
      1 + neighbors.map(&:fill).sum
    end
  end
end
