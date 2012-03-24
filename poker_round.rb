class PokerRound
  def initialize
    @hands = []
  end

  def add_hand(hand)
    @hands << hand
  end

  def [] (player)
    @hands.select { |h| h.player == player }.first
  end

  def winner
    high_hand.player
  end

  def high_hand
    @hands.sort[-1]
  end

end