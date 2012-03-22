class PokerHand
  attr_reader :player

  def initialize(player, cards)
    @player = player
    @cards = cards.map { |s| PokerCard.new(s) }
  end

  def sort
    @cards.sort
  end

  def high_card
    sort[-1]
  end

  def type
    :high_card
  end

  def type_rank
    high_card.rank
  end

  def <=>(other)
    high_card <=> other.high_card
  end
end