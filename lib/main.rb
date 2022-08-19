# frozen_string_literal: true

require_relative 'calculate_score'
require_relative 'score_logger'
require_relative 'player_score'
require_relative 'frame'

class Bowling_game
  def initialize
    @player = Player_score.new
    Score_logger.log_game(@player)
  end
end

game = Bowling_game.new
