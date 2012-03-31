require_relative 'poker_card'

class PokerCards
  def initialize(cards)
    @cards = cards.map { |s| PokerCard.new(s) }
  end

  def sort
    @cards.sort
  end

  def has_pair?
    @cards.any? { |c1| @cards.count{ |c2| c1.rank == c2.rank } > 1 }
  end

  def pair_value
    @cards.each { |c1| return c1.rank if @cards.count { |c2| c1.rank == c2.rank } > 1 }
  end
end