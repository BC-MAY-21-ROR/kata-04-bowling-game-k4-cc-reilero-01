# frozen_string_literal: true

class Player_score
  attr_accessor :score, :accumulated_score

  def initialize
    @score = Array.new(9) { Frame.new }
    add_score(Last_frame.new)
    @score.each(&:get_score)
    @accumulated_score = Array.new(10) { 0 }
    @accumulated_score = calc_total_score(@score)
  end

  def add_score(new_score)
    @score << new_score
  end

  def calc_total_score(score)
    total = 0
    accumulated_score = []
    score.each_with_index do |frame, index|
      total += if index < 9
                 if frame.strike
                   if score[index + 1].score[0] == 10 && index < 8
                     10 + score[index + 1].score[0] + score[index + 2].score[0]
                   else
                     10 + score[index + 1].score[0] + score[index + 1].score[1]
                   end

                 elsif frame.spare
                   10 + score[index + 1].score[0]
                 else
                   score[index].score[0] + score[index].score[1]
                 end
               elsif frame.strike || frame.spare
                 score[index].score[0] + score[index].score[1] + score[index].score[2]
               else
                 score[index].score[0] + score[index].score[1]
               end
      accumulated_score << total
    end
    accumulated_score
  end

  def list_score
    @score.each_with_index do |turn, index|
      print turn.score.join(' '), ' ', @accumulated_score[index]
      puts ''
    end
  end
end
