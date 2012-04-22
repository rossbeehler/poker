class OnePairPokerHandTieBreaker
  def initialize(left, right)
    @left = left
    @right = right
  end
  
  def do_compare
    return compare_rank_of_pairs if pairs_have_different_rank
    return compare_highest_non_pair_cards if highest_non_pair_cards_have_different_rank
    return compare_second_highest_non_pair_cards if second_highest_non_pair_cards_have_different_rank
    compare_third_highest_non_pair_cards
  end

  def compare_rank_of_pairs
    @left.cards.pair_values[0] <=> @right.cards.pair_values[0]
  end

  def pairs_have_different_rank
    @left.cards.pair_values[0] != @right.cards.pair_values[0]
  end

  def compare_highest_non_pair_cards
    @left.cards.non_pair_cards[2] <=> @right.cards.non_pair_cards[2]
  end

  def highest_non_pair_cards_have_different_rank
    @left.cards.non_pair_cards[2].rank != @right.cards.non_pair_cards[2].rank
  end

  def compare_second_highest_non_pair_cards
    @left.cards.non_pair_cards[1] <=> @right.cards.non_pair_cards[1]
  end

  def second_highest_non_pair_cards_have_different_rank
    @left.cards.non_pair_cards[1].rank != @right.cards.non_pair_cards[1].rank
  end

  def compare_third_highest_non_pair_cards
    @left.cards.non_pair_cards[0] <=> @right.cards.non_pair_cards[0]
  end
end
