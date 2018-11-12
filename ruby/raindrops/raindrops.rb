# Convert integer to a string based on divisors
module Raindrops
  SOUNDS = {
    'Pling' => 3,
    'Plang' => 5,
    'Plong' => 7
  }.freeze

  def self.convert(number)
    answer = SOUNDS.map do |sound, divisor|
      sound if (number % divisor).zero?
    end.join
    answer.empty? ? number.to_s : answer
  end
end
