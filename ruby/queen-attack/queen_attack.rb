class Queens
  def initialize(**args)
    @white = args[:white]
    @black = args[:black]
    check_position
  end

  def check_position
    raise ArgumentError, 'Invalid position' unless (0..7).cover?(@white[0]) &&
                                                   (0..7).cover?(@white[1])
  end

  def attack?
    return true if [@white[0] == @black[0],
                   @white[1] == @black[1],
                   (@white[0] - @black[0]).abs ==
                   (@white[1] - @black[1]).abs].any?

    false
  end
end
