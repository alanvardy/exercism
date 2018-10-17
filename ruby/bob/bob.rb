class Bob
  def self.hey(text)
    if text =~ /[A-Z]{4,}/
      if text =~ /[?]\z/
        "Calm down, I know what I'm doing!"
      else
        'Whoa, chill out!'
      end
    elsif text =~ /[A-Z]{2,}/ && text =~ /[!]\z/
      'Whoa, chill out!'
    elsif text =~ /[?]\z/
      'Sure.'
    elsif text == ''
      'Fine. Be that way!'
    elsif text =~ /\s\s/
      if text =~ /[?]/
        'Sure.'
      elsif text =~ /[a-z]+/
        'Whatever.'
      else
        'Fine. Be that way!'
      end
    else
      'Whatever.'
    end
  end
end
