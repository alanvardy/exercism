class Matrix
  def initialize(sequence)
    @sequence = sequence
  end

  def rows
    @sequence.split("\n").collect do |line|
      line.scan(/\d+/).map!(&:to_i)
    end
  end

  def columns
    rows.transpose
  end
end
