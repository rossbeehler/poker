require_relative '../../poker_hands/one_pair_poker_hand'
require_relative '../../poker_hand_factory'

def hand_of(cards)
  PokerHandFactory.create_hand(cards)
end

class OnePairPokerHand
  def should_be_greater_than(lesser_cards)
    lesser_hand = PokerHandFactory.create_hand(lesser_cards)
    compare_to(lesser_hand).should == :greater
  end

  def compare_to(lesser_hand)
    comparison_i = (self <=> lesser_hand)
    return :less if comparison_i == -1
    return :greater if comparison_i == 1
    :equal
  end
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

  context "tie-breaking hands" do
    it "uses rank of pair" do
      hand_of(%W(JS JC 2S 3S 4S)).should_be_greater_than(%W(10H 10D 2H 3H AS))
    end

    context "with matching pairs" do
      it "uses highest non-pair card" do
        hand_of(%W(4S 4C 2S 3S AS)).should_be_greater_than(%W(4H 4D 2H 3H KS))
      end

      it "uses 2nd highest non-pair card if highest non-pair cards match" do
        hand_of(%W(4S 4C 2S KS AS)).should_be_greater_than(%W(4H 4D 2H QH AS))
      end

      it "uses 3rd highest non-pair card if 1st and 2nd non-pair cards match" do
        hand_of(%W(4S 4C QS KS AS)).should_be_greater_than(%W(4H 4D JH KH AS))
      end

      it "declares draw if all cards match"
    end
  end
end