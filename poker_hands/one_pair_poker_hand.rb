require_relative 'poker_hand'

class OnePairPokerHand < PokerHand
  def type
    :one_pair
  end
end