module Grains
  VALID = (1..64)

  def self.square(number)
    raise ArgumentError, "Must be #{VALID}" unless VALID.cover?(number)

    2**(number - 1)
  end

  def self.total
    square(64) * 2 - 1
  end
end
