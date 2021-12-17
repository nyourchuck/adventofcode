require_relative '../../2021/day16'

describe Day16 do
  let(:sample) { Day16.new(:sample) }
  let(:sample2) { Day16.new(:sample2) }
  let(:input) { Day16.new(:input) }
  let(:packet) { Day16::Packet.consume_next!(binary) }

  it "should calculate sample answer 1" do
    expect(sample.answer1).to eq 31
  end

  it "should calculate input answer 1" do
    expect(input.answer1).to eq 923
  end

  it "should calculate input answer 2" do
    expect(sample.answer2).to eq 54
  end

  it "should calculate input answer 2" do
    expect(input.answer2).to eq 258888628940
  end

  describe "binary" do
    it "should convert short stuff" do
      expect(input.binary("D2FE28")).to eq "110100101111111000101000"
    end
  end

  describe "D2FE28" do
    let(:binary) { input.binary("D2FE28") }
    let(:packet) { Day16::Packet.new("110100") }

    it "should have a header" do
      expect(packet.header).to eq "110100"
    end

    it "should have a version" do
      expect(packet.version).to eq 6
    end

    it "should be literal" do
      expect(packet).to be_literal
    end

    it "should have a type" do
      expect(packet.type_id).to eq 4
    end

    describe "consuming" do
      it "should consume only its chunk" do
        string = "101111111000101000"
        remainder = packet.consume!(string)
        expect(string).to eq "000"
      end

      it "should consume value" do
        remainder = packet.consume!("101111111000101000")
        expect(packet.value).to eq 2021
      end
    end
  end

  it "should map hexes" do
    expect(input.binary("F")).to eq "1111"
  end

  describe "38006F45291200" do
    let(:binary) { sample.binary("38006F45291200") }
    let(:packet) { Day16::Packet.new("001110") }

    it "should have a header" do
      expect(packet.header).to eq "001110"
    end

    it "should have a version" do
      expect(packet.version).to eq 1
    end

    it "should have a type" do
      expect(packet.type_id).to eq 6
    end

    describe "consuming" do
      let(:packet) { Day16::Packet.consume_next!(binary) }

      it "should consume version" do
        expect(packet.version).to eq 1
        expect(binary).to eq "0000000"
      end

      it "should be an operator" do
        expect(packet).to be_operator
      end

      it "should have a length" do
        expect(packet.length).to eq 27
      end

      it "should have a length type" do
        expect(packet.length_type).to eq "0"
      end

      it "should have 2 subpackets" do
        expect(packet.subpackets.length).to eq 2
        expect(packet.subpackets[0].value).to eq 10
        expect(packet.subpackets[1].value).to eq 20
      end
    end

  end

  describe "EE00D40C823060" do
    let(:binary) { sample.binary("EE00D40C823060") }

    it "should have a header" do
      expect(packet.header).to eq "111011"
    end

    it "should have a version" do
      expect(packet.version).to eq 7
    end

    it "should have a type" do
      expect(packet.type_id).to eq 3
    end

    it "should have a length type" do
      expect(packet.length_type).to eq "1"
    end

    it "should have a length" do
      expect(packet.length).to eq 3
    end

    it "should be an operator" do
      expect(packet).to be_operator
    end

    it "should have 3 subpackets" do
      expect(packet.subpackets.length).to eq 3
      expect(packet.subpackets[0].value).to eq 1
      expect(packet.subpackets[1].value).to eq 2
      expect(packet.subpackets[2].value).to eq 3
    end
  end


  describe "8A004A801A8002F478" do
    let(:binary) { sample.binary("8A004A801A8002F478") }

    # represents an operator packet (version 4) which contains an operator packet (version 1) which contains an operator packet (version 5) which contains a literal value (version 6); this packet has a version sum of 16.

    it "should have a version" do
      expect(packet.version).to eq 4
    end

    it "should be an operator" do
      expect(packet).to be_operator
    end

    it "should have version sum" do
      expect(packet.version_sum).to eq 16
    end

  end

  describe "620080001611562C8802118E34" do
    let(:binary) { sample.binary("620080001611562C8802118E34") }
    # 620080001611562C8802118E34 represents an operator packet (version 3) which contains two sub-packets; each sub-packet is an operator packet that contains two literal values. This packet has a version sum of 12.

    it "should have version sum" do
      expect(packet.version_sum).to eq 12
    end
  end

  describe "C200B40A82" do
    let(:binary) { sample.binary("C200B40A82") }

    it "should calculate 3" do
      expect(packet.calculate).to eq 3
    end
  end

  describe "9C0141080250320F1802104A08" do
    let(:binary) { sample.binary("9C0141080250320F1802104A08") }

    it "should calculate 1" do
      expect(packet.calculate).to eq 1
    end
  end

  describe "CE00C43D881120" do
    let(:binary) { sample.binary("CE00C43D881120") }

    it "should calculate 9" do
      expect(packet.calculate).to eq 9
    end
  end
end
