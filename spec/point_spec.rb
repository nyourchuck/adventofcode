# frozen_string_literal: true

describe Point do
  let(:point1) { Point.new(2, 4) }
  let(:point2) { Point.new(2, 6) }
  let(:point3) { Point.new(0, 6) }

  it "has coordinates" do
    expect(point1.x).to eq 2
    expect(point1.y).to eq 4
  end

  it "can instantiate from key/value pairs" do
    expect(Point.new(x: 3, y: 5).to_s).to eq "3,5"
  end

  it "cannot instantiate from single number" do
    expect { Point.new(4) }.to raise_error("unknown point initializer")
  end

  it "can instantiate from string" do
    expect(Point.new("x=-5, y=-400").to_s).to eq "-5,-400"
  end

  it "calculates distance" do
    expect(point1.distance(point2)).to eq 2
    expect(point1.distance(point3)).to eq 4
  end
end
