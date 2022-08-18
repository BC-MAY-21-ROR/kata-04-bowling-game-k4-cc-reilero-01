require_relative "icons"
class Score_logger
    def initialize
    end

    def self.log_frame(frame)
        score_display = Icons.display_icons(frame.score)
        if frame.score.size == 2
            return "|  #{score_display[0]}  | #{score_display[1]} "
        else
            return "| #{score_display[0]} | #{score_display[1]} | #{score_display[2]} |"
        end
    end

    def self.log_game(player_score)
        top_row = ""
        player_score.score.each do |frame|
            top_row += log_frame(frame)
        end
        middle_row = "-" * top_row.size
        puts top_row
        puts middle_row        
        puts player_score.accumulated_score.map { |score| "|" + score.to_s.center(9) }.join("") + "|"
    end
end