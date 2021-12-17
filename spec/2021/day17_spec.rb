require_relative '../../2021/day17'

describe Day17 do
  let(:sample) { Day17.new(:sample) }
  let(:input) { Day17.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 45
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 12561
  end

  it "should calculate input answer 2" do
    expect(sample.answer2).to eq 112
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 3785
  end
end
