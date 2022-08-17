class Calculate_score
#This class gets or generates the score of each throw
    def initialize
        
    end

    def self.user_score
        score = gets("Escriba la puntuación del tiro: ")
        score
    end

    def self.random_score(upper_limit=10)
        rand(0..upper_limit)
    end

end