require_relative 'poker_hand'

class TwoPairPokerHand < PokerHand
  def type
    :two_pair
  end

  def tie_break(other_hand)
    if self.cards.pair_values[1] != other_hand.cards.pair_values[1] 
      return self.cards.pair_values[1] <=> other_hand.cards.pair_values[1]
    end
    if self.cards.pair_values[0] != other_hand.cards.pair_values[0]
      return self.cards.pair_values[0] <=> other_hand.cards.pair_values[0]
    end

    return self.cards.non_pair_cards[0] <=> other_hand.cards.non_pair_cards[0]
  end
end
