class Score_logger
    def initialize
    end

    def self.log_frame(frame)
        #frame.strike? 
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
        print "|  #{first_score}  | #{second_score} |"
    end

    def self.log_game(player_score)

    end
end