require_relative 'poker_hand'
require_relative 'one_pair_poker_hand_tie_breaker'
require_relative '../poker_cards'

class OnePairPokerHand < PokerHand
  def type
    :one_pair
  end

  def type_rank
    @cards.pair_value
  end

  def tie_break(other_hand)
    OnePairPokerHandTieBreaker.new(self, other_hand).do_compare
  end

  def sort_and_remove_pair
    sorted = @cards.sort
    sorted.delete(@cards.pair_value)
    sorted
  end
end
