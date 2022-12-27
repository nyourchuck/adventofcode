# frozen_string_literal: true

require 'pry-byebug'

describe Day14 do
  let(:sample) { Day14.new(:sample) }
  let(:input) { Day14.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 31
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 29
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 528
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 522
  end
end