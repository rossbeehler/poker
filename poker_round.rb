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

  def winners
    sorted_hands = @hands.sort_by {|player, hand| hand}

    winning_hands = [sorted_hands.pop]
    while sorted_hands.size > 0 and sorted_hands[-1][1] == winning_hands[0][1]
      winning_hands << sorted_hands.pop
    end

    winning_hands.map {|x| x[0] }.sort
  end
end
