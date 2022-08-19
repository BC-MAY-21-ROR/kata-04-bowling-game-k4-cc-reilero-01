class Icons
  attr_reader :square_icon, :triangle_icon

  @@square_icon = "\u25a0"
  @@square_icon = @@square_icon.encode('utf-8')
  @@triangle_icon = "\u25e2"
  @@triangle_icon = @@triangle_icon.encode('utf-8')
  def initialize; end

  def self.display_icons(score)
    result = []
    if score.size == 2
      if score[0] == 10
        result = [' ', @@square_icon]
      elsif result = Icons.spare(score[0], score[1])
      end
    else
      total_score = 0
      score.each do |toss|
        if toss == 10
          result << @@square_icon
        else
          total_score += toss
          result << if total_score == 10
                      @@triangle_icon
                    else
                      toss
                    end
        end
      end
    end
    result
  end

  def self.spare(score_1, score_2)
    display = []
    if score_1 + score_2 == 10
      [score_1, @@triangle_icon]
    else
      [score_1, score_2]
    end
  end

  def self.square_icon
    @@square_icon
  end

  def self.triangle_icon
    @@triangle_icon
  end
end
