require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup_1 = Startup.new("Henry's Startup", "Henry", "Fitness Technology")
startup_2 = Startup.new("Marijuana Startup", "Seth", "Recreational Marijuana")
startup_3 = Startup.new("Soda Water Finder", "Henry", "Food & Bev")
vc_1 = VentureCapitalist.new("Andre", 50000)
vc_2 = VentureCapitalist.new("Elon Musk", 190000000000)
vc_3 = VentureCapitalist.new("Bezos", 190000000000)
vc_4 = VentureCapitalist.new("Buffett", 15000000000)
fr_1 = FundingRound.new(startup_1, vc_2, 560000)
fr_2 = FundingRound.new(startup_2, vc_1, 56, "Pre-Seed")
fr_3 = FundingRound.new(startup_3, vc_3, 78000000, "Series A")

startup_1.sign_contract(vc_2, 200000, "Series A")
startup_1.sign_contract(vc_4, 5000000, "Series C")
startup_1.sign_contract(vc_1, 2000, "Angel")

vc_2.offer_contract(startup_2, 670000000, "Series B")
vc_4.offer_contract(startup_2, 500000, "Series C")

startup_1.num_funding_rounds

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

