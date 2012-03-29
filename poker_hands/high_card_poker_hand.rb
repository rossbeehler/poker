require_relative 'poker_hand'

class HighCardPokerHand < PokerHand
  def type
    :high_card
  end
end