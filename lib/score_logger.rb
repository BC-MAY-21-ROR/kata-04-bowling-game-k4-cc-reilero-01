class Score_logger
    def initialize
    end

    def self.log_frame(frame)
        
        square = "\u2B1B"
        triangle = "\u25e2"
        if frame.strike
            first_score = ""
            second_score = square.encode('utf-8') 
        elsif frame.spare
            first_score = frame.score[0]
            second_score = triangle.encode('utf-8')
        else
            first_score = frame.score[0]
            second_score = frame.score[1]
        end

        "|  #{first_score}  | #{second_score} "
    end

    def self.log_game(player_score)
        top_row = ""
        player_score.score.each do |frame|
            top_row += log_frame(frame)
        end
        top_row += "|"
        middle_row = "-" * top_row.size
        puts top_row
        puts middle_row        
        puts player_score.accumulated_score.map { |score| "|" + score.to_s.center(9) }.join("") + "|"
    end
end