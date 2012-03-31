require_relative '../poker_hand_factory'

def hand_type_of(cards)
  PokerHandFactory.create_hand(cards).type
end

describe PokerHandFactory do
  it "finds a high card" do
    hand_type_of(%W(2S 3S)).should == :high_card
  end

  it "finds a pair among two cards" do
    hand_type_of(%W(2S 2C)).should == :one_pair
  end

  it "finds a pair at the back of three cards" do
    hand_type_of(%W(3S 2S 2C)).should == :one_pair
  end

  it "finds a pair spread out in the hand" do
    hand_type_of(%W(2S 3S 2C)).should == :one_pair
  end
end
