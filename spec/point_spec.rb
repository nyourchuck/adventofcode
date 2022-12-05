# frozen_string_literal: true

describe Point do
  let(:point1) { Point.new(2,4) }
  let(:point2) { Point.new(2,6) }

  it "has coordinates" do
    expect(point1.x).to eq 2
    expect(point1.y).to eq 4
  end
end
