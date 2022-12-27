# frozen_string_literal: true

require 'pry-byebug'

describe Day15 do
  let(:sample) { Day15.new(:sample) }
  let(:input) { Day15.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 26
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 56000011
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 5525990
  end

  it "calculates input answer 2", :speed => 'slow' do
    expect(input.answer2).to eq 11756174628223
  end
end
