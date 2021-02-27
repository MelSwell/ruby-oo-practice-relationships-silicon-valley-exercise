class FundingRound
  attr_reader :startup, :venture_capitalist
  attr_accessor :type, :investment

  @@all = []
  
  def initialize(startup, vc, investment_amount, type = "Angel")
    @startup = startup
    @venture_capitalist = vc
    @type = type
    @investment = investment_amount.to_f
    @@all << self
  end

  def self.all
    @@all
  end

end
