require_relative '../../poker_hands/high_card_poker_hand'
require_relative '../../poker_hand_factory'

def hand_of(cards)
  PokerHandFactory.create_hand(cards)
end

describe HighCardPokerHand do
  it "should have a type of high_card" do
    hand_of(%W(AS)).type.should == :high_card
  end

  context "rank of high card" do
    it "finds high card in front of hand" do
      hand_of(%W(AS 2S)).type_rank.should == "A"
    end

    it "finds high card in back of hand" do
      hand_of(%W(2S AS)).type_rank.should == "A"
    end

    it "finds high card in middle of hand" do
      hand_of(%W(2S AS 3S)).type_rank.should == "A"
    end
  end
end