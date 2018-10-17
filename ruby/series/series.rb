class Series
  def initialize(string)
    @string = string
  end

  def slices(segment_length)
    too_long if past_end?(segment_length)

    first = 0
    answer = []
    @string.length.times do
      break if past_end?(first + segment_length)

      answer << @string[first, segment_length]
      first += 1
    end
    answer
  end

  def past_end?(last)
    last > @string.length
  end

  def too_long
    raise ArgumentError, 'Cannot make a slice larger than string'
  end
end
