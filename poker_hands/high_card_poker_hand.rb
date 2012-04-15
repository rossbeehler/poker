require_relative 'poker_hand'

class HighCardPokerHand < PokerHand
  def type
    :high_card
  end

  def tie_break(other_hand)
    @cards.sort[-1] <=> other_hand.cards.sort[-1]
  end
end
