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

  def saddle_points
    points = []
    rows.each_with_index do |row, y_index|
      row.each_with_index do |value, x_index|
        points << [y_index, x_index] if value == row.max &&
                                        value == columns[x_index].min
      end
    end
    points
  end
end
