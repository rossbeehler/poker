require_relative '../poker_card'
require_relative 'high_card_poker_hand'
require_relative 'one_pair_poker_hand'

class PokerHandFactory
  def self.create_hand(cards)
    @cards = cards.map { |s| PokerCard.new(s) }

    return OnePairPokerHand.new(@cards) if @cards.any? { |c1| @cards.count{ |c2| c1.rank == c2.rank } > 1 }

    HighCardPokerHand.new(@cards)
  end
end
