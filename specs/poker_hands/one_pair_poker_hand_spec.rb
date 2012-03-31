require_relative '../../poker_hands/one_pair_poker_hand'
require_relative '../../poker_hand_factory'

def hand_of(cards)
  PokerHandFactory.create_hand(cards)
end

describe OnePairPokerHand do
  it "should have a type of one_pair" do
    hand_of(%W(2S 2C)).type.should == :one_pair
  end

  context "rank of pair" do
    it "ranks pair of highest cards in hand" do
      hand_of(%W(2S 3S 3C)).type_rank.should == "3"
    end

    it "ranks pair of lowest cards in hand" do
      hand_of(%W(2S 2C 3S)).type_rank.should == "2"
    end
  end
end