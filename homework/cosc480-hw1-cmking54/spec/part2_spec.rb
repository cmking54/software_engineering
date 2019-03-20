require 'rspec'
require 'part2'

describe "Part 2 tests" do
  context "RPS game winner tests" do
    # rps_game_winner
    it "should be defined" do
      expect {
        rps_game_winner [ [ "Nina", "P" ], [ "Halima", "S" ] ]
      }.not_to raise_error
    end
    # extra tests
    it "should not play with non-2 players" do
        expect {
            rps_game_winner [ [] , [], [] ]
            rps_game_winner [ [] ]
        }.to raise_error(WrongNumberOfPlayersError)
    end

    it "should not allow unknown input" do
        expect {
            rps_game_winner [ ["", "F"], ["", "2"] ]
        }.to raise_error(NoSuchStrategyError)
    end

    it "should let Player 2 win" do 
        expect([ "Player 2", "S" ]  == rps_game_winner([["", "P"], ["Player 2", "S"]])).to be true
    end
  end

  context "RPS tournament tests" do
    # rps_tournament_winner
    it "should be defined" do
      expect {
        rps_tournament_winner [[[ ["Armando", "P" ], ["Dave", "S"] ],
                                [ ["Richard", "R"],  ["Michael", "S"] ], 
                                ], 
                                [[ ["Allen", "S"], ["Omer", "P"] ], 
                                [ ["David E.", "R"], ["Richard X.", "P"] ] ] ]
      }.not_to raise_error
    end
  end
end
