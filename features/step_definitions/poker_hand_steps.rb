require_relative '../../poker_round'

Given /^a poker round is complete$/ do
  @poker_round = PokerRound.new
end

Given /^(\w+) has the cards (.*)$/ do |player, cards|
  @poker_round.add_cards(player.to_sym, cards.split(','))
end

Then /^(\w+) has a ([^(]*)[(](.+)[)]$/ do |player, hand_type, hand_type_rank|
  @poker_round[player.to_sym].type.should == hand_type.strip.downcase.sub(/ /,"_").to_sym
  @poker_round[player.to_sym].type_rank.should == hand_type_rank
end

Then /^the winner is (.*)$/ do |winner|
  @poker_round.winner.should == winner.to_sym
end
