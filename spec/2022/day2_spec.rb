require_relative '../../2022/day2'

describe Day2 do

  let(:sample) { Day2.new(:sample) }
  let(:input) { Day2.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 15
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 12
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 14531
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 11258
  end
end
