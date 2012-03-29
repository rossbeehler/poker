class PokerHand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def sort
    @cards.sort
  end

  def type_rank
    high_card.rank
  end

  def high_card
    sort[-1]
  end

  def <=>(other_hand)
    if self.type == other_hand.type
      return high_card <=> other_hand.high_card
    end

    self.type <=> other_hand.type
  end
end