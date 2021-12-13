require_relative '../../2021/day12'

describe Day12 do
  let(:sample) { Day12.new(:sample) }
  let(:input) { Day12.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 10
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 3463
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 36
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 91533
  end
end
