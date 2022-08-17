require_relative 'calculate_score'

class Frame
    attr_reader :score, :spare, :strike 

    def initialize
        @score = [0,0]
        @spare = false
        @strike = false
        get_score
    end

    def get_score
        @score[0] = Calculate_score.random_score
        if @score[0] < 10
            @score[1] = Calculate_score.random_score(10-@score[0])
            if @score[1] + @score[0] == 10
                @spare = true
            end
        else
            @strike = true
        end
    end


end