class PokerCard
  attr_reader :rank

  def initialize(as_string)
    @as_string = as_string
    @rank = @as_string[0..@as_string.size-2]
  end

  def <=>(other)
    rank_i <=> other.rank_i
  end

  def rank_i
    return 14 if @rank == "A"
    return 13 if @rank == "K"
    return 12 if @rank == "Q"
    return 11 if @rank == "J"
    @rank.to_i
  end
  
  def to_s
    @as_string
  end
end