class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    (1...limit). select { |number| divisible?(number)}.sum
  end

  def divisible?(number)
    @factors.any? { |factors| (number % factors).zero? }
  end
end
