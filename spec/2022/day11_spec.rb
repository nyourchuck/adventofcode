# frozen_string_literal: true

describe Day11 do
  let(:sample) { Day11.new(:sample) }
  let(:input) { Day11.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 10_605
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 2_713_310_158
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 118_674
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 32_333_418_600
  end
end
