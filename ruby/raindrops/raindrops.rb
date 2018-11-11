module Raindrops
  def self.convert(number)
    answer = ''
    answer += 'Pling' if number % 3 == 0
    answer += 'Plang' if number % 5 == 0
    answer += 'Plong' if number % 7 == 0
    answer.empty? ? number.to_s : answer
  end
end
