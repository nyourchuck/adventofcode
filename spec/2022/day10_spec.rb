# frozen_string_literal: true

describe Day10 do
  let(:sample) { Day10.new(:sample) }
  let(:input) { Day10.new(:input) }

  it "calculates sample answer 1" do
    expect(sample.answer1).to eq 13140
  end

  it "calculates sample answer 2" do
    expect(sample.answer2).to eq <<~EOF.chomp
      ##..##..##..##..##..##..##..##..##..##..
      ###...###...###...###...###...###...###.
      ####....####....####....####....####....
      #####.....#####.....#####.....#####.....
      ######......######......######......####
      #######.......#######.......#######.....
    EOF
  end

  it "calculates input answer 1" do
    expect(input.answer1).to eq 12560
  end

  it "calculates input answer 2" do
    expect(input.answer2).to eq <<~EOF.chomp
      ###..#....###...##..####.###...##..#....
      #..#.#....#..#.#..#.#....#..#.#..#.#....
      #..#.#....#..#.#..#.###..###..#....#....
      ###..#....###..####.#....#..#.#....#....
      #....#....#....#..#.#....#..#.#..#.#....
      #....####.#....#..#.#....###...##..####.
    EOF
  end
end
