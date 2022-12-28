# frozen_string_literal: true

require "pry-byebug"

describe Day15 do
  let(:sample) { Day15.new(:sample) }
  let(:input) { Day15.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 26
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 56_000_011
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 5_525_990
  end

  it "calculates input answer 2", speed: "slow" do
    expect(input.answer2).to eq 11_756_174_628_223
  end
end
