# frozen_string_literal: true

require_relative 'icons'
class Score_logger
  def initialize; end

  def self.log_frame(frame)
    score_display = Icons.display_icons(frame.score)
    if frame.score.size == 2
      "|  #{score_display[0]}  | #{score_display[1]} "
    else
      "| #{score_display[0]} | #{score_display[1]} | #{score_display[2]} |"
    end
  end

  def self.log_game(player_score)
    top_row = ''
    bot_row = ''
    player_score.score.each_with_index do |frame, index|
      top_row += log_frame(frame)
      frame_length = log_frame(frame).size
      frame_length -= if index < 9
                        1
                      else
                        2
                      end
      bot_row += "|#{player_score.accumulated_score[index].to_s.center(frame_length)}"
    end
    middle_row = '-' * top_row.size
    puts top_row
    puts middle_row
    puts "#{bot_row}|"
  end
end
