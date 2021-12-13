require_relative '../../2021/day13'

describe Day13 do
  let(:sample) { Day13.new(:sample) }
  let(:input) { Day13.new(:input) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 17
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 671
  end

  it "should calculate sample answer 2" do
    expect(sample.answer2).to eq <<~EOS
      #####
      #···#
      #···#
      #···#
      #####
    EOS
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq <<~EOS
      ###···##··###··#··#··##··###··#··#·#···
      #··#·#··#·#··#·#··#·#··#·#··#·#·#··#···
      #··#·#····#··#·####·#··#·#··#·##···#···
      ###··#····###··#··#·####·###··#·#··#···
      #····#··#·#····#··#·#··#·#·#··#·#··#···
      #·····##··#····#··#·#··#·#··#·#··#·####
    EOS
  end
end
