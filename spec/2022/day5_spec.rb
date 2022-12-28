# frozen_string_literal: true

describe Day5 do
  let(:sample) { Day5.new(:sample) }
  let(:input) { Day5.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq "CMZ"
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq "MCD"
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq "ZSQVCCJLL"
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq "QZFJRWHGS"
  end
end
