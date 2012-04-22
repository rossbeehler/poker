require_relative 'poker_hand'
require_relative 'one_pair_poker_hand_tie_breaker'

class OnePairPokerHand < PokerHand
  def type
    :one_pair
  end

  def tie_break(other_hand)
    OnePairPokerHandTieBreaker.new(self, other_hand).do_compare
  end
end
