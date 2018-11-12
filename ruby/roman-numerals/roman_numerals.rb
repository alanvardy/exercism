class Integer
  ROMAN_NUMERALS = [
    [1000, 'M'],
    [900, 'CM'],
    [500, 'D'],
    [400, 'CD'],
    [100, 'C'],
    [90, 'XC'],
    [50, 'L'],
    [40, 'XL'],
    [10, 'X'],
    [9, 'IX'],
    [5, 'V'],
    [4, 'IV'],
    [1, 'I']
  ].freeze

  def to_roman
    remainder = self
    result = ''
    Integer::ROMAN_NUMERALS.each do |value, numeral|
      until remainder < value
        remainder -= value
        result += numeral
      end
    end
    result
  end
end