require_relative '../poker_hand_factory'

def hand_type_of(cards)
  PokerHandFactory.create_hand(:player1, cards).type
end

describe PokerHandFactory do
  it "finds a high card" do
    hand_type_of(%W(2S 3S)).should == :high_card
  end

  it "finds a pair" do
    hand_type_of(%W(2S 2C 3S 4S 5S)).should == :one_pair
  end

  it "finds a pair at the back of three cards" do
    hand_type_of(%W(3S 4S 5S 2S 2C)).should == :one_pair
  end

  it "finds a pair spread out in the hand" do
    hand_type_of(%W(2S 3S 4S 5S 2C)).should == :one_pair
  end

  it "finds two pairs" do
    hand_type_of(%W(AD 2S 2C 3S 3C)).should == :two_pair
  end
end
