require_relative '../../2021/day20'

describe Day20 do
  let(:sample) { Day20.new(:sample) }
  let(:input) { Day20.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 35
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 5680
  end

  it "should calculate input answer 2" do
    expect(sample.answer2).to eq 3351
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 19766
  end
end
