require_relative 'poker_card'

class PokerCards
  def initialize(cards)
    @cards = cards.map { |s| PokerCard.new(s) }
    @card_ranks = @cards.map { |c| c.rank } 
  end

  def sort
    @cards.sort
  end

  def has_one_pair?
    @card_ranks.uniq.count == 4
  end

  def has_two_pairs?
    @card_ranks.uniq.count == 3
  end

  def pair_values
    @card_ranks.dups
  end 

  def non_pair_cards
    @cards.reject { |c| pair_values.include?(c.rank) }
  end
end

module Enumerable
  def dups
    inject({}) {|h,v| h[v]=h[v].to_i+1; h}.reject{|k,v| v==1}.keys
  end
end
