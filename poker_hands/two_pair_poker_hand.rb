require_relative 'poker_hand'
require_relative 'two_pair_poker_hand_tie_breaker'

class TwoPairPokerHand < PokerHand
  def type
    :two_pair
  end

  def tie_break(other_hand)
    TwoPairPokerHandTieBreaker.new(self, other_hand).do_compare
  end
end
