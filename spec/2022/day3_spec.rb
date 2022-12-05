# frozen_string_literal: true

describe Day3 do
  let(:sample) { Day3.new(:sample) }
  let(:input) { Day3.new(:input) }

  it "calculates priority" do
    expect(sample.priority("a")).to eq 1
    expect(sample.priority("z")).to eq 26
    expect(sample.priority("A")).to eq 27
    expect(sample.priority("Z")).to eq 52
  end

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 157
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 70
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 7850
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 2581
  end
end
