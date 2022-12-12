# frozen_string_literal: true

describe Day11 do
  let(:sample) { Day11.new(:sample) }
  let(:input) { Day11.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 10605
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 2713310158
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 118674
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 32333418600
  end
end
