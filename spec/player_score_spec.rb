# frozen_string_literal: true

require_relative '../lib/player_score'
require_relative '../lib/frame'

describe Player_score do
  before do
    @player = Player_score.new
  end
  describe '#calc_total_score' do
    context 'given three strikes in a row' do
      it 'the total score of the first strike will be added 30' do
        @player.score[0].score = [10, 0]
        @player.score[0].strike = true
        @player.score[1].score = [10, 0]
        @player.score[1].strike = true
        @player.score[2].score = [10, 0]
        @player.score[2].strike = true
        accumulated_score = @player.calc_total_score(@player.score)
        expect(accumulated_score[0]).to eq(30)
      end
    end
  end
end
