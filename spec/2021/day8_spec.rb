require_relative '../../2021/day8'

describe Day8 do
  let(:sample) { Day8.new(:sample) }
  let(:input) { Day8.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 26
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 245
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 61229
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 983026
  end
end
