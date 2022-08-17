require_relative 'calculate_score'
require_relative 'score_logger'
require_relative 'player_score'
require_relative 'frame'

class Bowling_game
    def initialize
        @player = Player_score.new
        Score_logger.log_frame(@player.score[0])
        # @player.list_score
    end
end

game = Bowling_game.new