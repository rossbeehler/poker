require_relative '../../poker_round'
require_relative '../../poker_hand'
require_relative '../../poker_card'

Given /^a poker round is complete$/ do
  @poker_round = PokerRound.new
end

Given /^(\w+) has the cards (.*)$/ do |player, cards|
  poker_hand = PokerHand.new(player.to_sym, cards.split(','))
  @poker_round.add_hand(poker_hand)
end

Then /^(\w+) has a ([^(]*)[(](.+)[)]$/ do |player, hand_type, hand_type_rank|
  @poker_round[player.to_sym].type.to_sym.should == hand_type.strip.downcase.sub(/ /,"_").to_sym
  @poker_round[player.to_sym].type_rank.should == hand_type_rank
end

Then /^the winner is (.*)$/ do |winner|
  @poker_round.winner.should == winner.to_sym
end
