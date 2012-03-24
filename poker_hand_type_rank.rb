class PokerHandTypeRank
  attr_reader :value

  def initialize(type)
    @value = 0 if type == :high_card
    @value = 1 if type == :one_pair
  end

  def <=>(other)
    @value <=> other.value
  end
end