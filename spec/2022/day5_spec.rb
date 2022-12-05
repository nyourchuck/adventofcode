# frozen_string_literal: true

describe Day4 do
  let(:sample) { Day4.new(:sample) }
  let(:input) { Day4.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 2
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 4
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 490
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 921
  end
end
