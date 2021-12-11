require_relative '../../2021/day11'

describe Day11 do
  let(:sample) { Day11.new(:sample) }
  let(:input) { Day11.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 1656
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 1652
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 195
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 220
  end
end
