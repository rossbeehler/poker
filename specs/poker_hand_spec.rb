require_relative '../poker_hand'
require_relative '../poker_card'

def sort(cards)
  hand_of(cards).sort.map { |c| c.to_s }
end

def hand_of(cards)
  PokerHand.new(:player1, cards)
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

  context "detect type" do
    it "finds a high card" do
      hand_of(%W(2S 3S)).type.should == :high_card
    end

    it "finds a pair among two cards" do
      hand_of(%W(2S 2C)).type.should == :one_pair
    end

    it "finds a pair at the back of three cards" do
      hand_of(%W(3S 2S 2C)).type.should == :one_pair
    end

    it "finds a pair spread out in the hand" do
      hand_of(%W(2S 3S 2C)).type.should == :one_pair
    end
  end

  context "detect type rank" do
    it "finds high card rank for one card" do
      hand_of(%W(2S)).type_rank.should == "2"
    end

    it "finds a high card rank for two cards" do
      hand_of(%W(2S 3S)).type_rank.should == "3"
    end
  end
end