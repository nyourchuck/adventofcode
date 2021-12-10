require_relative '../../2021/day10'

describe Day10 do
  let(:sample) { Day10.new(:sample) }
  let(:input) { Day10.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 26397
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 374061
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 288957
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 2116639949
  end
end
