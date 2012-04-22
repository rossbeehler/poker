class TwoPairPokerHandTieBreaker
  def initialize(left, right)
    @left = left
    @right = right
  end
  
  def do_compare
    return compare_rank_of_high_pairs if high_pair_ranks_differ
    return compare_rank_of_low_pairs if low_pair_ranks_differ
    compare_non_pair_card
  end

  def compare_rank_of_high_pairs
    @left.cards.pair_values[1] <=> @right.cards.pair_values[1]
  end

  def high_pair_ranks_differ
    @left.cards.pair_values[1] != @right.cards.pair_values[1] 
  end

  def compare_rank_of_low_pairs
    @left.cards.pair_values[0] <=> @right.cards.pair_values[0]
  end
  
  def low_pair_ranks_differ
    @left.cards.pair_values[0] != @right.cards.pair_values[0]
  end

  def compare_non_pair_card
    @left.cards.non_pair_cards[0] <=> @right.cards.non_pair_cards[0]
  end
end
