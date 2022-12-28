# frozen_string_literal: true

require "pry-byebug"

describe Day13 do
  let(:sample) { Day13.new(:sample) }
  let(:input) { Day13.new(:input) }

  describe "compare" do
    it "sorts integers" do
      expect(sample.compare(1, 2)).to eq(-1)
      expect(sample.compare(3, 2)).to eq 1
    end

    it "sorts lists" do
      l1 = [1, 2]
      l2 = [3, 4]
      l3 = [1, 4]
      expect(sample.compare(l1, l2)).to eq(-1)
      expect(sample.compare(l1, l3)).to eq(-1)
    end

    it "sorts lists2" do
      l2 = [3, 4]
      l3 = [1, 4]
      expect(sample.compare(l3, l2)).to eq(-1)
    end

    it "sorts integer vs lists" do
      l1 = [1, 2]
      l2 = [3, 4]
      expect(sample.compare([1], l2)).to eq(-1)
      expect(sample.compare(1, l2)).to eq(-1)
      expect(sample.compare(4, l1)).to eq 1
      expect(sample.compare(l1, 3)).to eq(-1)
    end

    it "sorts 2nd example" do
      l1 = [[1], [2, 3, 4]]
      l2 = [[1], 4]
      expect(sample.compare(l1, l2)).to eq(-1)
    end

    it "sorts another example" do
      l1 = [9]
      l2 = [[8, 7, 6]]
      expect(sample.compare(l1, l2)).to eq 1
    end

    it "sorts 7s example" do
      l1 = [7, 7, 7, 7]
      l2 = [7, 7, 7]
      expect(sample.compare(l1, l2)).to eq 1
    end
  end

  it "sorts sample answer" do
    expect(sample.orders).to eq [-1, -1, 1, -1, 1, -1, 1, 1]
  end

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 13
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq 140
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 5340
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq 21_276
  end
end
