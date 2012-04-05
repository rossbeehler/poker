class OnePairPokerHandTieBreaker
  def initialize(left, right)
    @left = left
    @right = right
  end
  
  def do_compare
    if pairs_have_different_rank
      return compare_rank_of_pairs
    end

    if highest_non_pair_cards_have_different_rank
      return compare_highest_non_pair_cards
    end

    if second_highest_non_pair_cards_have_different_rank
      return compare_second_highest_non_pair_cards
    end

    compare_third_highest_non_pair_cards
  end

  def pairs_have_different_rank
    @left.type_rank != @right.type_rank
  end

  def compare_rank_of_pairs
    @left.type_rank <=> @right.type_rank
  end

  def compare_third_highest_non_pair_cards
    @left.sort_and_remove_pair[-3] <=> @right.sort_and_remove_pair[-3]
  end

  def highest_non_pair_cards_have_different_rank
    @left.sort_and_remove_pair[-1].rank != @right.sort_and_remove_pair[-1].rank
  end

  def compare_highest_non_pair_cards
    @left.sort_and_remove_pair[-1] <=> @right.sort_and_remove_pair[-1]
  end

  def second_highest_non_pair_cards_have_different_rank
    @left.sort_and_remove_pair[-2].rank != @right.sort_and_remove_pair[-2].rank
  end

  def compare_second_highest_non_pair_cards
    @left.sort_and_remove_pair[-2] <=> @right.sort_and_remove_pair[-2]
  end
end