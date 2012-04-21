require_relative 'poker_hand_spec_helper.rb'
require_relative '../../poker_hands/two_pair_poker_hand'
require_relative '../../poker_hand_factory'

describe TwoPairPokerHand do
  it "should have a type of two_pair" do
    hand_of(%W(2S 2C 3S 3C 5S)).type.should == :two_pair
  end

  context "tie-breaking hands" do
    it "uses rank of top pair" do
        hand_of(%W(2S 2C 5S 5C KS)).should_be_greater_than(%W(3H 3D 4H 4D AH))
    end

    it "uses rank of bottom pair if top pair rank ties" do
        hand_of(%W(2S 2C 5S 5C KS)).should_be_less_than(%W(3H 3D 5H 5D AH))
    end

    it "uses rank of non-pair card if both pairs tied" do
        hand_of(%W(2S 2C 3S 3C KS)).should_be_less_than(%W(2H 2D 3H 3D AH))
    end

    it "declares draw if all cards match"
#      hand_of(%W(JS JC 2S 3S 4S)).should_be_greater_than(%W(10H 10D 2H 3H AS))
#    end
#
#    context "with matching pairs" do
#      it "uses highest non-pair card" do
#        hand_of(%W(4S 4C 2S 3S AS)).should_be_greater_than(%W(4H 4D 2H 3H KS))
#      end
#
#      it "uses 2nd highest non-pair card if highest non-pair cards match" do
#        hand_of(%W(4S 4C 2S KS AS)).should_be_greater_than(%W(4H 4D 2H QH AS))
#      end
#
#      it "uses 3rd highest non-pair card if 1st and 2nd non-pair cards match" do
#        hand_of(%W(4S 4C QS KS AS)).should_be_greater_than(%W(4H 4D JH KH AS))
#      end
#
#      it "declares draw if all cards match" do
#        hand_of(%W(2S 2C 3S 4S 5S)).should_equal(%W(2H 2D 3H 4H 5H))
#      end
#    end
  end
end
