class Matrix
  attr_reader :rows, :columns
  def initialize(sequence)
    @rows = to_rows(sequence)
    @columns = @rows.transpose
  end

  private

  def to_rows(sequence)
    sequence.lines.map { |line| int_array(line) }
  end

  def int_array(line)
    line.scan(/\d+/).map(&:to_i)
  end
end
