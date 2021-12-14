require_relative '../../2021/day14'

describe Day14 do
  let(:sample) { Day14.new(:sample) }
  let(:input) { Day14.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 1588
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 2360
  end

  it "should calculate sample answer 1 16x" do
    expect(sample.answer1(16)).to eq 117020
  end

  it "should calculate sample answer 2 10x" do
    expect(sample.answer2(10)).to eq 1588
  end

  it "should calculate input answer 2 10x" do
    expect(input.answer2(10)).to eq 2360
  end

  it "should calculate sample answer 2 16x" do
    expect(sample.answer2(16)).to eq 117020
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 2188189693529
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 2967977072188
  end
end
