class Squares
  def initialize(integer)
    @integer = integer
  end

  def square_of_sum
    num_array.sum**2
  end

  def sum_of_squares
    num_array.sum { |value| value**2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  def num_array
    (1..@integer)
  end
end
