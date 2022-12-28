# frozen_string_literal: true

class Graph
  def initialze
  end

  def internal
    @internal ||= {}
  end

  def add(x, y, node)
    node.key = key(x, y)
    internal[node.key] = node
  end

  def get(x, y)
    internal[key(x, y)]
  end

  def remove(key)
    internal.delete(key)
  end

  def values
    internal.values
  end

  def key(x, y)
    "#{x}:#{y}"
  end

  def neighbors(x, y)
    [
      get(x - 1, y),
      get(x, y - 1),
      get(x, y + 1),
      get(x + 1, y)
    ].compact
  end
end
