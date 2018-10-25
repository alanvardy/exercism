class Matrix
  def initialize(sequence)
    @lines = sequence.split("\n")
    @lines.each_index do |i|
      @lines[i] = @lines[i].scan(/\d+/).map(&:to_i)
    end
  end

  def rows
    @lines
  end

  def columns
    columns = []
    @lines.each_index do |i|
      columns << @lines.map { |x| x[i] }
    end
    columns
  end
end
