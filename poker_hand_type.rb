require_relative 'poker_hand_type_rank'

class PokerHandType
  def initialize(hand)
    @type = :high_card
    (hand.cards.size-1).times { |i| @type = :one_pair if hand.sort[i].rank == hand.sort[i+1].rank }
  end

  def rank
    PokerHandTypeRank.new(@type)
  end

  def to_sym
    @type
  end

  def ==(other_type)
    self.to_sym == other_type.to_sym
  end

  def <=>(other_type)
    self.rank <=> other_type.rank
  end
end