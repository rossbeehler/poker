require_relative 'poker_cards'
require_relative 'poker_hands/high_card_poker_hand'
require_relative 'poker_hands/one_pair_poker_hand'
require_relative 'poker_hands/two_pair_poker_hand'

class PokerHandFactory
  def self.create_hand(player, cards)
    @cards = PokerCards.new(cards)

    return TwoPairPokerHand.new(player, @cards) if @cards.has_two_pairs?
    return OnePairPokerHand.new(player, @cards) if @cards.has_one_pair?

    HighCardPokerHand.new(player, @cards)
  end
end
