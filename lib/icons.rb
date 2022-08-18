class Icons 
    attr_reader :square_icon, :triangle_icon

    @@square_icon = "\u2B1B"
    @@square_icon = @@square_icon.encode('utf-8')
    @@triangle_icon = "\u25e2"
    @@triangle_icon = @@triangle_icon.encode('utf-8')
    def initialize
    end

    def self.display_icons(score)
        result = []
        if score.size==2
            if score[0] == 10
                result = [' ',@@square_icon]
            elsif
                result = Icons.spare(score[0],score[1])
            end
        else
            total_score = 0
            score.each do |toss|
                if toss == 10
                    result << @@square_icon
                else
                    total_score += toss
                    if total_score == 10
                        result << @@triangle_icon
                    else
                        result << toss
                    end
                end
            end
        end
        result
    end

    def self.spare(score_1, score_2)
        display = []
        if score_1+score_2 == 10
            display = [score_1,@@triangle_icon]
        else
            display = [score_1,score_2]
        end
        display
    end

    def self.square_icon
        @@square_icon
    end

    def self.triangle_icon
        @@triangle_icon
    end

end