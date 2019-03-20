class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

# part a
def rps_game_winner(game)
    turn_sanity_check(game)
    return turn_logic(game)
end

def turn_sanity_check(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    raise NoSuchStrategyError unless game[0][1].match(/^[rps]$/i) != nil
    raise NoSuchStrategyError unless game[1][1].match(/^[rps]$/i) != nil
end

def turn_logic(game)
    case game[0][1]
    when "R"
        return game[1][1].upcase == 'P' ? game[1] : game[0]
    when "P"
        return game[1][1].upcase == 'S' ? game[1] : game[0]
    when "S"
        return game[1][1].upcase == 'R' ? game[1] : game[0]
    end
end
# part b
def rps_tournament_winner(tournament_list)
    if tournament_list[0][0].instance_of?(String) and tournament_list[1][0].instance_of?(String)
        return rps_game_winner(tournament_list)
    end
    return rps_game_winner ([ rps_tournament_winner(tournament_list[0]), 
                              rps_tournament_winner(tournament_list[1]) ])
end
