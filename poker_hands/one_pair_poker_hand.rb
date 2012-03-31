require_relative 'poker_hand'
require_relative '../poker_cards'

class OnePairPokerHand < PokerHand
  def type
    :one_pair
  end

  def type_rank
    @cards.pair_value
  end
end