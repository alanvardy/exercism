module Prime
  def self.nth(num)
    raise ArgumentError, 'Must be greater than 0' if num < 1

    primes = []
    counter = 1
    while primes.length < num
      counter += 1
      primes << counter if primes.none? { |x| (counter % x).zero? }
    end
    primes.last
  end
end
