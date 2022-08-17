class Player_score
    attr_reader :score

    def initialize
        @score = Array.new(9){Frame.new}
        add_score(Last_frame.new)
        @score.each do |frame|
            frame.get_score
        end
        @accumulated_score = Array.new(10){0}
    end

    def add_score(new_score)
        @score << new_score
    end

    def calc_total_score
        @score.each_with_index do |frame,index|
            if index < 9
                if frame.strike
                    if frame[index+1].score == 10 && index < 8
                        @accumulated_score[index] += 10 + frame[index+1].score[0] + frame[index+2].score[0]
                    else
                        @accumulated_score[index] += 10 + frame[index+1].score[0] + frame[index+1].score[1]
                    end

                elsif frame.spare
                    @accumulated_score[index] += 10 + frame[index+1].score[0]
                else
                    @accumulated_score[index] += frame[index].score[0] + frame[index].score[1]
                end
            else
                if frame.strike || frame.spare
                    @accumulated_score[index] += frame[index].score[0] + frame[index].score[1] + frame[index].score[2]
                else
                    @accumulated_score[index] += frame[index].score[0] + frame[index].score[1]
                end
            end
        end

    end

    def list_score
        @score.each do |turn|
            puts turn.score.join(" ")
        end
    end
end