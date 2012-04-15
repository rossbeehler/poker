require_relative 'poker_hand_spec_helper.rb'
require_relative '../../poker_hands/high_card_poker_hand'
require_relative '../../poker_hand_factory'

describe HighCardPokerHand do
  it "should have a type of high_card" do
    hand_of(%W(AS)).type.should == :high_card
  end

  context "tie break" do
    it "uses highest card" do
      hand_of(%W(2S 3S 4S 5S JS)).should_be_greater_than(%W(2H 3H 4H 5H 10H))
    end
  end
end
