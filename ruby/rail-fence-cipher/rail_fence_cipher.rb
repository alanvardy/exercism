module RailFenceCipher
  class << self
    def encode(string, num_rails)
      sequence = build_sequence(num_rails)
      text = string.split('').reverse
      text_to_code(num_rails, sequence, text)
    end

    def decode(string, num_rails)
      sequence = build_sequence(num_rails)
      lengths = rail_lengths(string.length, num_rails, sequence)
      rails = lengths.map { |num| string.slice!(0...num).reverse.chars }
      rails_to_text(rails, sequence)
    end

    private

    def build_sequence(num_rails)
      (0...num_rails).to_a + (1...(num_rails - 1)).to_a.reverse
    end

    def rail_lengths(length, num_rails, sequence)
      lengths = Array.new(num_rails, 0)
      while length > 0
        sequence.each do |rail|
          break unless length > 0

          length -= 1
          lengths[rail] += 1
        end
      end
      lengths
    end

    def text_to_code(num_rails, sequence, text)
      code = Array.new(num_rails, '')

      until text.empty?
        sequence.each do |rail|
          code[rail] += text.pop unless text.empty?
        end
      end
      code.join
    end

    def rails_to_text(rails, sequence)
      output = ''
      until rails.join.empty?
        sequence.each do |rail|
          output += rails[rail].pop unless rails[rail].empty?
        end
      end
      output
    end
  end
end
