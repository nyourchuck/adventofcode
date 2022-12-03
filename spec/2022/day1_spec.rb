# frozen_string_literal: true

require_relative "../../2022/day1"

describe Day1 do
  let(:sample) { Day1.new(:sample) }
  let(:input) { Day1.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 24_000
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 45_000
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 68_442
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 204_837
  end
end
