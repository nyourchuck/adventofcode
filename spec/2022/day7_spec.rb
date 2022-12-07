
# frozen_string_literal: true

describe Day6 do
  let(:sample) { Day6.new(:sample) }
  let(:input) { Day6.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 95437
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 24933642
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 1325919
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 2050735
  end
end
