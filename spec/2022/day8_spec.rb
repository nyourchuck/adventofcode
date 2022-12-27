
# frozen_string_literal: true

describe Day8 do
  let(:sample) { Day8.new(:sample) }
  let(:input) { Day8.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 21
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 8
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 1794
  end

  it "calculates input answer 2", :speed => 'slow' do
    expect(input.answer2).to eq 199272
  end
end
