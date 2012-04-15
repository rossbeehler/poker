require_relative '../poker_cards'

def sort(cards)
  PokerCards.new(cards).sort.map{|c| c.to_s}
end

describe PokerCards do
  context "sorting cards" do
    it "should sort numeric cards" do
      sort(%W(3S 2S)).should == %W(2S 3S)
    end

    it "should sort jack higher than ten" do
      sort(%W(JS 10S)).should == %W(10S JS)
    end

    it "should sort queen higher than jack" do
      sort(%W(QS JS)).should == %W(JS QS)
    end

    it "should sort king higher than queen" do
      sort(%W(KS QS)).should == %W(QS KS)
    end

    it "should sort ace higher than king" do
      sort(%W(AS KS)).should == %W(KS AS)
    end
  end
end
