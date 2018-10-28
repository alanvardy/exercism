class HighScores
  attr_reader :scores, :highest, :latest, :top

  def initialize(scores)
    @scores = scores
    @highest = scores.max
    @latest = scores.last
    @top = scores.sort { |a, b| -(a <=> b) }[0..2]
  end

  def report
    if @latest == @highest
      "Your latest score was #{@latest}. That's your personal best!"
    else
      "Your latest score was #{@latest}. " \
        "That's #{@highest - @latest} short of your personal best!"
    end
  end
end
