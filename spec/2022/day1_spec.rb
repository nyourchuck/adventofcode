require_relative '../../2022/day1'

describe Day1 do

  let(:sample) { Day1.new(:sample) }
  let(:input) { Day1.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 24000
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 45000
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 68442
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 204837
  end
end
