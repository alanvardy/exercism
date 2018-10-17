class PhoneNumber
  def self.clean(number)
    new_number = ''
    number.split('').each do |digit|
      new_number += digit if digit =~ /\d/
    end
    new_number.slice!(0) if has_country_code?(new_number)
    return nil unless valid_number?(new_number)

    new_number
  end

  def self.has_country_code?(number)
    number.length == 11 && number[0] == '1'
  end

  def self.valid_number?(number)
    return false unless number.length == 10

    return false if number[0] == '0' ||
                    number[0] == '1' ||
                    number[3] == '0' ||
                    number[3] == '1'

    true
  end
end
