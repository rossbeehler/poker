require_relative 'poker_hand_type_rank'

class PokerHandType
  attr_reader :type

  def initialize(hand)
    @type = :high_card
    (hand.cards.size-1).times { |i| @type = :one_pair if hand.sort[i].rank == hand.sort[i+1].rank }
  end

  def rank
    PokerHandTypeRank.new(@type)
  end

  def ==(other_type)
    @type == other_type or @type == other_type.type
  end
end