# frozen_string_literal: true

describe Day2 do
  let(:sample) { Day2.new(:sample) }
  let(:input) { Day2.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 15
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 12
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 14_531
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 11_258
  end
end
