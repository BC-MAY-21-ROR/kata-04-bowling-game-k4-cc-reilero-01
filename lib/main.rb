require_relative 'calculate_score'
require_relative 'score_logger'
require_relative 'player_score'
require_relative 'frame'

class Bowling_game
    def initialize
        @player = Player_score.new
        @player.calc_total_score
        Score_logger.log_game(@player)
        @player.list_score
    end
end

game = Bowling_game.new