class Player_score
    attr_reader :score, :accumulated_score

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
        total = 0
        @score.each_with_index do |frame,index|
            if index < 9
                if frame.strike
                    if @score[index+1].score == 10 && index < 8
                        total += 10 + @score[index+1].score[0] + @score[index+2].score[0]
                    else
                        total += 10 + @score[index+1].score[0] + @score[index+1].score[1]
                    end

                elsif frame.spare
                    total += 10 + @score[index+1].score[0]
                else
                    total += @score[index].score[0] + @score[index].score[1]
                end
            else
                if frame.strike || frame.spare
                    total += @score[index].score[0] + @score[index].score[1] + @score[index].score[2]
                else
                    total += @score[index].score[0] + @score[index].score[1]
                end
            end
            @accumulated_score[index] = total
        end
    end

    def list_score
        @score.each_with_index do |turn, index|
            print turn.score.join(" "), " ", @accumulated_score[index]
            puts ""
        end
    end
end