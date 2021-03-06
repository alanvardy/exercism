module Alphametics
  class << self
    def solve(puzzle)
      sides = puzzle.split('==')
      left = quantities(sides[0])
      right = quantities(sides[1])
      brute_force(left, right, not_zero(puzzle))
    end

    # builds a hash with num of (base-10 adjusted) occurances of letter
    def quantities(string)
      hash = {}
      string.scan(/\w+/).each do |seq|
        factor = 1
        seq.reverse.chars do |char|
          hash[char] = hash.key?(char) ? hash[char] + factor : factor
          factor *= 10
        end
      end
      hash
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

    def brute_force(left, right, non_zero)
      letters = (left.keys + right.keys).uniq
      length = letters.length
      values = (0...length).to_a.reverse
      values[0] -= 1
      loop do
        values = increment(values)
        return {} if (unique = values.uniq) == [9]
        next if unique.length != length || bad_zero?(letters, values, non_zero)
        left_side = sum(left, letters, values)
        right_side = sum(right, letters, values)
        return answer_hash(letters, values) if left_side == right_side
      end
    end

    def answer_hash(letters, values)
      letters.zip(values).to_h
    end

    def increment(values)
      marker = 0
      loop do
        return values unless (values[marker] += 1) == 10
        values[marker] = 0
        marker += 1
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