module Hamming
  class << self
    def compute(dna1, dna2)
      reject unless equal_length?(dna1, dna2)

      dna1.chars.zip(dna2.chars).count { |one, two| one != two }
    end

    def reject
      raise ArgumentError, 'Strands not equal length'
    end

    def equal_length?(dna1, dna2)
      dna1.length == dna2.length
    end
  end
end
