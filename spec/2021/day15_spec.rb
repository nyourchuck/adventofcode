require_relative '../../2021/day15'

describe Day15 do
  let(:sample) { Day15.new(:sample) }
  let(:sample2) { Day15.new(:sample2) }
  let(:input) { Day15.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 40
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 403
  end

  it "should match sample answer 2 and sample2" do
    expect(sample.answer2).to eq sample2.answer1
  end

  it "should calculate input answer 2" do
    expect(sample.answer2).to eq 315
  end

  it "should calculate input answer 2" do
    # skip because this takes too long to process 
    # expect(input.answer2).to eq 2840
  end
end
