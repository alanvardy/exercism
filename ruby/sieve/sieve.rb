class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    return [] if @limit < 2

    unsorted = list(1, @limit)
    remainder = []
    while unsorted.any?
      remainder << unsorted.shift
      unsorted -= list(remainder.last, @limit)
    end
    remainder
  end

  def list(multiplier, max)
    list = []
    counter = 2
    loop do
      list << counter * multiplier
      return list if (counter += 1) * multiplier > max
    end
  end
end
