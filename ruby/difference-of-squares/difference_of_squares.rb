class Squares
  def initialize(integer)
    @integer = integer
  end

  def square_of_sum
    square(sum)
  end

  def sum_of_squares
    sum(true)
  end

  def difference
    square_of_sum - sum_of_squares
  end

  private

  def square(value, sqr = true)
    sqr ? value * value : value
  end

  def sum(sqr = false, counter = 1, sum = 1)
    return sum if counter == @integer
    counter += 1
    sum(sqr, counter, sum + square(counter, sqr))
  end
end
