class Grid

  def initialize
    @internal = {}
    @neighbors = {}
  end

  def add(p, node)
    key = key(p.x,p.y)
    @internal[key] = node
  end

  def get(x,y)
    @internal[key(x,y)]
  end

  def remove(key)
    @internal.delete(key)
  end

  def values
    @internal.values
  end

  def key(x,y)
    [x,y]
  end

  def neighbors(node)
    nodes = @neighbors[node]
    if nodes.nil?
      (x,y) = [node.point.x, node.point.y]
      nodes = [
        get(x-1,y),
        get(x,y-1),
        get(x,y+1),
        get(x+1,y),
      ].compact
      @neighbors[node] = nodes
    end
    nodes
  end
end
