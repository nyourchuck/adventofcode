require_relative '../../2021/day9'

describe Day9 do
  let(:sample) { Day9.new(:sample) }
  let(:input) { Day9.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 15
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 545
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 1134
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 950600
  end
end
