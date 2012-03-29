require_relative 'poker_hands/poker_hand_factory'

class PokerRound < Hash
  def add_cards(player, cards)
    self[player] = PokerHandFactory.create_hand(cards)
  end

  def hands
    values
  end

  def winner
    invert[high_hand]
  end

  def high_hand
    hands.sort[-1]
  end
end