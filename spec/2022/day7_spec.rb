# frozen_string_literal: true

describe Day7 do
  let(:sample) { Day7.new(:sample) }
  let(:input) { Day7.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 95_437
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 24_933_642
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 1_325_919
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 2_050_735
  end
end
