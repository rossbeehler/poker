require_relative 'poker_hand_factory'

class PokerRound
  def initialize
    @hands = {}
  end

  def add_cards(player, cards)
    @hands[player] = PokerHandFactory.create_hand(cards)
  end

  def [](player)
    @hands[player]
  end

  def winner
    @hands.invert[high_hand]
  end

  def high_hand
    @hands.values.sort[-1]
  end
end