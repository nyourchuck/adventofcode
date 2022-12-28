# frozen_string_literal: true

class Grid
  def initialize
    @internal = {}
    @neighbors = {}
  end

  def add(p, node)
    key = key(p.x, p.y)
    @internal[key] = node
  end

  def get(x, y)
    @internal[key(x, y)]
  end

  def remove(point)
    @internal.delete(key(point.x, point.y))
  end

  def values
    @internal.values.to_a
  end

  def key(x, y)
    [x, y]
  end

  def neighbors(node)
    nodes = @neighbors[node]
    if nodes.nil?
      x = node.point.x
      y = node.point.y
      nodes = [
        get(x - 1, y),
        get(x, y - 1),
        get(x, y + 1),
        get(x + 1, y)
      ].compact
      @neighbors[node] = nodes
    end
    nodes
  end
end
