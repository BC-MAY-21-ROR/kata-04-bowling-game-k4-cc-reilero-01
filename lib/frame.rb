# frozen_string_literal: true

require_relative 'calculate_score'

class Frame
  attr_accessor :score, :spare, :strike

  def initialize
    @score = [0, 0]
    @spare = false
    @strike = false
  end

  def get_score
    @score[0] = Calculate_score.random_score
    if @score[0] < 10
      @score[1] = Calculate_score.random_score(10 - @score[0])
      @spare = true if @score[1] + @score[0] == 10
    else
      @strike = true
    end
  end
end

class Last_frame < Frame
  def initialize
    super
    @score << 0
  end

  def get_score
    @score[0] = Calculate_score.random_score
    if @score[0] < 10
      @score[1] = Calculate_score.random_score(10 - @score[0])
      if @score[1] + @score[0] == 10
        @spare = true
        @score[2] = Calculate_score.random_score
      end
    else
      @strike = true
      @score[1] = Calculate_score.random_score
      if @score[1] == 10
        @score[2] = Calculate_score.random_score
      else
        @score[2] = Calculate_score.random_score(10 - @score[1])
        @spare = true
      end
    end
    # print @score
  end
end
