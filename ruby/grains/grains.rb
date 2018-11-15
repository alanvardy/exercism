module Grains
  VALID = (1..64).freeze

  def self.square(number)
    raise ArgumentError, "Must be #{VALID}" unless VALID.cover?(number)

    # answer *= 2 while (number -= 1) > 0
    # answer
    return number if number == 1
    answer = 1
    (1...number).inject(0) { answer *= 2 }
  end

  def self.total
    # total = value = 1
    # 63.times { total += (value *= 2) }
    # total
    value = 1
    VALID.inject(0) { value *= 2 } - 1
  end
end
