class Matrix
  attr_reader :lines
  def initialize(sequence)
    @lines = sequence.lines
  end

  def rows
    @lines.map(&:int_array)
  end

  def columns
    rows.transpose
  end

  def int_array(string)
    string.scan(/\d+/).map(&:to_i)
  end
end
