class RunLengthEncoding
  def self.encode(input)
    @output = ''
    letter = ''
    count = 0
    input.chars.each do |char|
      if letter != char
        count = add_to_output(count, letter)
        letter = char
      end
      count += 1
    end
    count = add_to_output(count, letter)
    @output
  end

  def self.add_to_output(count, letter)
    @output += count.to_s if count > 1
    @output += letter
    0
  end

  def self.decode(input)
    output = ''
    repeat = 1
    input.scan(/[a-zA-Z ]|\d+/).each do |item|
      if item =~ /\d+/
        repeat = item.to_i
      else
        repeat.times { output += item }
        repeat = 1
      end
    end
    output
  end
end
