class Card
  include Comparable

  attr_accessor :rank, :suit, :value

  def initialize(rank, suit, value)
    @rank = rank
    @suit = suit
    @value = value
  end

  def <=>(other)
    self.value <=> other.value
  end
  
  def to_s
    "#{@rank} of #{@suit}"
  end
end
