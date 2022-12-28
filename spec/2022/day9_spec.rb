# frozen_string_literal: true

describe Day9 do
  let(:sample) { Day9.new(:sample) }
  let(:input) { Day9.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 13
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 1
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 6337
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 2455
  end
end
