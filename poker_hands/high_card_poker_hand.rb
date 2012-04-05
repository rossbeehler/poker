require_relative 'poker_hand'

class HighCardPokerHand < PokerHand
  def type
    :high_card
  end

  def tie_break(other_hand)
    self.high_card <=> other_hand.high_card
  end
end