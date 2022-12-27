# frozen_string_literal: true

class Day15 < Puzzle
  class Sensor
    attr_accessor :point, :beacon, :distance, :y
    def initialize(point, beacon)
      @point = point
      @beacon = beacon
      @distance = @point.distance(beacon)
      @y = point.y
    end

    def y_range
      @y_range ||= ((y-distance)..(y+distance))
    end
  end

  def filter
    lines.map do |line|
      (sensor, beacon) = line.split(':').map { |p| Point.new(p) }
      Sensor.new(sensor, beacon)
    end
  end

  def x_range_covered_by_sensor(sensor, y)
    length = sensor.distance - (y-sensor.y).abs
    if length > 0
      x = sensor.point.x
      ((x-length)..(x+length))
    end
  end

  def combine_two_ranges(r1, r2)
    if r1.end >= r2.begin
      (r1.begin..([r2.end, r1.end].max))
    else
      :both
    end
  end

  def combine_all_ranges(ranges)
    ranges = ranges.sort_by(&:begin)
    all_ranges = []
    r1 = ranges.shift
    while ranges.any?
      r2 = ranges.shift
      result = combine_two_ranges(r1,r2)
      if result == :both
        all_ranges.push r1
        r1 = r2
      else
        r1 = result
      end
    end
    all_ranges.push r1
    all_ranges
  end

  def row
    @row = (data.length < 20) ? 10 : 2_000_000
  end

  def answer1
    all_scans = data.map { |sensor| 
      x_range_covered_by_sensor(sensor, row)
    }.compact
    scans = combine_all_ranges(all_scans)
    scans = scans[0].to_a
    beacons = data.select { |s| s.beacon.y == row }.map { |s| s.beacon.to_s }.uniq.count
    scans.count - beacons
  end

  def answer2
    y = 0
    (0..(row*2)).each do |index|
      all_scans = data.map { |sensor| 
        x_range_covered_by_sensor(sensor, index)
      }.compact
      scans = combine_all_ranges(all_scans)
      if scans.length > 1 && scans[0].end > 0
        return (scans[0].end + 1) * 4000000 + index
      end
    end
  end
end
