class Nucleotide
  class << self
    def from_dna(sequence)
      @sequence = sequence.chars
      raise ArgumentError, 'Invalid letters' if bad_chars?

      self
    end

    def bad_chars?
      @sequence.any? { |char| %w[A T G C].none? char }
    end

    def count(letter)
      @sequence.count { |char| char == letter }
    end

    def histogram
      result = { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
      @sequence.each do |letter|
        result[letter] += 1
      end
      result
    end
  end
end
