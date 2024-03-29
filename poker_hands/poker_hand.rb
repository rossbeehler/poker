class PokerHand
  attr_reader :player
  attr_reader :cards

  def initialize(player, cards)
    @player = player
    @cards = cards
  end

  def ==(other_hand)
    (self <=> other_hand) == 0
  end

  def <=>(other_hand)
    if self.type == other_hand.type
      return self.tie_break(other_hand)
    end

    self.type <=> other_hand.type
  end
end
