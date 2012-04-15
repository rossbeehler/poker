require_relative '../poker_round'

def add_hand(player, cards)
  subject.add_cards(player, cards)
end

describe PokerRound do
  context "registering hands" do
    it "accepts hands for one player" do
      add_hand(:player1, %W(AS))
      subject[:player1].should_not be_nil
    end

    it "accepts hands for two players" do
      add_hand(:player1, %W(AS))
      add_hand(:player2, %W(AC))
      subject[:player2].should_not be_nil
    end
  end

  context "knows the rank of hand types" do
    it "picks one pair over high card" do
      add_hand(:player1, %W(AS))
      add_hand(:player2, %W(2S 2C 3S 4S 5S))
      subject.winners.should == [:player2]
    end

    it "picks two pair over one pair" do
      add_hand(:player1, %W(2S 2C 3S 3C 4S))
      add_hand(:player2, %W(2S 2C 3S 4S 5S))
      subject.winners.should == [:player1]
    end
  end

  context "recognizes draws" do
    it "declares single winners" do
      add_hand(:player1, %W(AS))
      add_hand(:player2, %W(KS))
      subject.winners.should == [:player1]
    end

    it "declares multiple winners" do
      add_hand(:player1, %W(AS))
      add_hand(:player2, %W(AD))
      subject.winners.should == [:player1, :player2]
    end

    it "does not declare everyone a winner" do
      add_hand(:player1, %W(AS))
      add_hand(:player2, %W(KS))
      add_hand(:player3, %W(AS))
      subject.winners.should == [:player1, :player3]
    end
  end
end
