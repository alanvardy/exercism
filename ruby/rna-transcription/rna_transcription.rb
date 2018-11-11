module Complement
  class << self
    def of_dna(sequence)
      sequence.chars.map do |char|
        case char
        when 'C' then 'G'
        when 'G' then 'C'
        when 'T' then 'A'
        when 'A' then 'U'
        end
      end
              .join
    end
  end
end
