require_relative '../../2021/day7'

describe Day7 do
  let(:sample) { Day7.new(:sample) }
  let(:input) { Day7.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 37
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq 168
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 357353
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 104822130
  end
end
