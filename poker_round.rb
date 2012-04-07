require_relative 'poker_hand_factory'

class PokerRound
  def initialize
    @hands = [] 
  end

  def add_cards(player, cards)
    @hands << PokerHandFactory.create_hand(player, cards)
  end

  def [](player)
    @hands.select{|x| x.player == player}[0]
  end

  def winners
    sorted_hands = @hands.sort

    winning_hands = [sorted_hands.pop]
    while sorted_hands.size > 0 and sorted_hands[-1] == winning_hands[0]
      winning_hands << sorted_hands.pop
    end

    winning_hands.map {|x| x.player }.sort
  end
end
