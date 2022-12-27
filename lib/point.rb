class Point
  attr_accessor :x, :y

  def initialize(*args)
    if args.length == 2
      (@x, @y) = args.map(&:to_i)
    elsif args.first.class == Hash
      @x = args[0][:x].to_i
      @y = args[0][:y].to_i
    elsif args[0].class == String
      (@x, @y) = args[0].scan(/\-?\d+/).map(&:to_i)
    else
      raise "unknown point initializer"
    end
  end

  def to_s
    "#{x},#{y}"
  end

  def distance(other)
    (x - other.x).abs + (y-other.y).abs
  end
end
    
