require_relative '../poker_hand_factory'

def sort(cards)
  hand_of(cards).sort.map { |c| c.to_s }
end

def hand_of(cards)
  PokerHandFactory.create_hand(:player1, cards)
end

describe PokerHand do
  context "sorting cards" do
    it "returns already sorted cards" do
      sort(%W(2S 3S)).should == %W(2S 3S)
    end

    it "sorts two number cards" do
      sort(%W(3S 2S)).should == %W(2S 3S)
    end

    it "sorts a ten higher than a nine" do
      sort(%W(10S 9S)).should == %W(9S 10S)
    end

    it "sorts a jack higher than a ten" do
      sort(%W(JS 10S)).should == %W(10S JS)
    end

    it "sorts a queen higher than a jack" do
      sort(%W(QS JS)).should == %W(JS QS)
    end

    it "sorts a king higher than a queen" do
      sort(%W(KS QS)).should == %W(QS KS)
    end

    it "sorts an ace higher than a king" do
      sort(%W(AS KS)).should == %W(KS AS)
    end
  end
end
