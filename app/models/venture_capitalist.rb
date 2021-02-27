class VentureCapitalist
  attr_accessor :name, :total_worth

  @@all = []
  
  def initialize(name, worth)
    @name = name
    @total_worth = worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    VentureCapitalist.all.select { |vc| vc.total_worth > 1000000000 }
  end

  def offer_contract(startup, investment_amount, type)
    FundingRound.new(startup, self, investment_amount, type)
  end

  def funding_rounds
    FundingRound.all.select { |fr| fr.venture_capitalist == self }
  end

  def portfolio
    funding_rounds.map { |fr| fr.startup }.uniq
  end

  def biggest_investment
    funding_rounds.map {|fr| fr.investment}.max
  end

  def invested(domain)
    funding_rounds.select { |fr| fr.startup.domain == domain }
      .map { |fr| fr.investment }
      .reduce(0) { |sum, num| sum + num }
  end

end
