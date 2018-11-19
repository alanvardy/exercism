module Brackets
  # brackets
  INDIVIDUAL = /\(|\)|\{|\}|\[|\]/.freeze
  PAIRED = /\(\)|\{\}|\[\]/.freeze
  MATCHED = [['(', ')'], ['{', '}'], ['[', ']']].freeze

  class << self
    def paired?(string)
      brackets = string.scan(INDIVIDUAL)
      eliminate_outer(eliminate_inner(brackets))
    end

    def eliminate_inner(brackets)
      brackets.join.gsub(PAIRED, '').split('')
    end

    def eliminate_outer(brackets)
      until brackets.empty?
        return false unless matched?(brackets.shift, brackets.pop)
      end
      true
    end

    def matched?(front, back)
      MATCHED.any? { |pair| front == pair[0] && back == pair[1] }
    end
  end
end
