class Node
  attr_accessor :key
  attr_accessor :grid
  attr_accessor :value

  def initialize(key, grid)
    @key = key
    self.grid = grid
  end

  def x
    key[0]
  end

  def y
    key[1]
  end

  def at(x1, y1)
    grid.at([x + x1, y + y1])
  end

  def new_key(new_key)
    grid.delete(key)
    self.key = new_key
    grid[key] = self
  end
end
