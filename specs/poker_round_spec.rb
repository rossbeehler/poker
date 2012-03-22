require_relative '../poker_round'
require_relative '../poker_hand'

def add_hand(player, cards)
  subject.add_hand(PokerHand.new(player, cards))
end

describe PokerRound do
  context "registering hands" do
    it "accepts hands for one player" do
      add_hand(:player1, %W(AS))
      subject[:player1].player.should == :player1
    end

    it "accepts hands for two players" do
      add_hand(:player1, %W(AS))
      add_hand(:player2, %W(AC))
      subject[:player2].player.should == :player2
    end
  end

  context "picking a high card hand winner" do
    it "handles numeric high cards" do
      add_hand(:player1, %W(2S))
      add_hand(:player2, %W(3S))
      subject.winner.should == :player2
    end

    it "picks high jack over ten" do
      add_hand(:player1, %W(10S))
      add_hand(:player2, %W(JS))
      subject.winner.should == :player2
    end

    it "picks high queen over jack" do
      add_hand(:player1, %W(JS))
      add_hand(:player2, %W(QS))
      subject.winner.should == :player2
    end

    it "picks high king over queen" do
      add_hand(:player1, %W(QS))
      add_hand(:player2, %W(KS))
      subject.winner.should == :player2
    end
  end
end