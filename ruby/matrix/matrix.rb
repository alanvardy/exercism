class Matrix
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  def rows
    @rows ||= @sequence.lines.map do |line|
      line.split(' ').map(&:to_i)
    end
  end

  def columns
    @columns ||= rows.transpose
  end
end
