# frozen_string_literal: true

describe MinimalDay1 do
  let(:sample) { MinimalDay1.new(:sample, :day1) }
  let(:input) { MinimalDay1.new(:input, :day1) }

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
