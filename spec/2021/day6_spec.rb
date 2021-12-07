require_relative '../../2021/day6'

describe Day6 do

  let(:sample) { Day6.new(:sample) }
  let(:input) { Day6.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 5934
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 26984457539
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 362740
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 1644874076764
  end
end
