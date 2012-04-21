def hand_of(cards)
  PokerHandFactory.create_hand(:player1, cards)
end

class PokerHand
  def should_be_greater_than(other_cards)
    (self <=> hand_of(other_cards)).should == 1
  end

  def should_be_less_than(other_cards)
    (self <=> hand_of(other_cards)).should == -1
  end

  def should_equal(other_cards)
    (self <=> hand_of(other_cards)).should == 0
    (self == hand_of(other_cards)).should == true
  end
end

