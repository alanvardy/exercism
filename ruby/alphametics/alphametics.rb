module Alphametics
  class << self
    def solve(puzzle)
      puzzle2 = puzzle.split('==')
      left_side = quantities(puzzle2[0])
      right_side = quantities(puzzle2[1])
      brute_force(left_side, right_side, not_zero(puzzle))
    end

    # builds a hash with num of (base-10 adjusted)
    # occurances of letter
    def quantities(string)
      quantity = {}
      string.scan(/\w+/).each do |seq|
        decimal_place = 1
        seq.reverse.chars do |char|
          if quantity.key?(char)
            quantity[char] += (1 * decimal_place)
          else
            quantity[char] = (1 * decimal_place)
          end
          decimal_place *= 10
        end
      end
      quantity
    end

    # returns an array of all letters that cannot be zero
    def not_zero(string)
      string.scan(/\b\w/).uniq.sort
    end

    # determines if an invalid letter is
    def bad_zero?(letters, values, non_zero)
      (0...letters.length).any? do |index|
        values[index].zero? && non_zero.include?(letters[index])
      end
    end

    def brute_force(left_side, right_side, non_zero)
      letters = (left_side.keys + right_side.keys).uniq
      length = letters.length
      values = (0...length).to_a.reverse
      values[0] -= 1
      loop do
        values = increment(values)
        return {} if (unique = values.uniq) == [9]
        next if unique.length != length || bad_zero?(letters, values, non_zero)

        left = sum(left_side, letters, values)
        right = sum(right_side, letters, values)
        return answer_hash(letters, values, length) if left == right
      end
    end

    def answer_hash(letters, values, length)
      (0...length).map do |index|
        [letters[index], values[index]]
      end.to_h
    end

    def increment(values)
      marker = 0
      loop do
        values[marker] += 1
        if values[marker] == 10
          values[marker] = 0
          marker += 1
        else
          return values
        end
      end
    end

    def sum(side, letters, values)
      total_value = 0
      (0...letters.length).each do |index|
        letter = letters[index]
        next unless side.key?(letter)

        total_value += (values[index] * side[letter])
      end
      total_value
    end
  end
end