class Player_score
    attr_reader :score

    def initialize
        @score = Array.new(10){Frame.new}
    end

    def add_score(new_score)
        @score << new_score
    end

end