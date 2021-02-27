class Startup
  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []
  
  def initialize(name, founder, domain)
    @name = name
    @domain = domain
    @founder = founder
    @@all << self
  end

  def self.all
    @@all
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.find_by_founder(founder_name)
    Startup.all.find { |startup| startup.founder == founder_name }
  end

  def self.domains
    Startup.all.map { |startup| startup.domain }
  end

  def sign_contract(vc, investment_amount, type)
    FundingRound.new(self, vc, investment_amount, type)
  end

  def num_funding_rounds
    FundingRound.all.select { |fr| fr.startup == self }.count
  end

  def all_funding_rounds_for_itself
    FundingRound.all.select { |fr| fr.startup == self }
  end

  def total_funds
    all_funding_rounds_for_itself.map { |fr| fr.investment }
      .reduce(0) {|sum, num| sum + num}
  end

  def investors
    all_funding_rounds_for_itself.map { |fr| fr.venture_capitalist }.uniq
  end

  def big_investors
    investors.select {|investor| VentureCapitalist.tres_commas_club.any?(investor) }
  end

end
