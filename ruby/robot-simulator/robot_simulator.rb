class Robot
  def orient(direction)
    valid_direction?(direction)
    @direction = direction
  end

  def bearing
    @direction
  end

  def at(x, y)
    @x = x
    @y = y
  end

  def coordinates
    [@x, @y]
  end

  def valid_direction?(direction)
    raise ArgumentError, 'Invalid Direction' unless %i[east west north south].include?(direction)
  end

  def advance
    case @direction
    when :north
      @y += 1
    when :east
      @x += 1
    when :south
      @y -= 1
    when :west
      @x -= 1
    end
  end

  def turn_right
    case @direction
    when :north
      @direction = :east
    when :east
      @direction = :south
    when :south
      @direction = :west
    when :west
      @direction = :north
    end
  end

  def turn_left
    case @direction
    when :north
      @direction = :west
    when :east
      @direction = :north
    when :south
      @direction = :east
    when :west
      @direction = :south
    end
  end
end

class Simulator
  def instructions(string)
    string.chars.map do |char|
      case char
      when 'L'
        :turn_left
      when 'R'
        :turn_right
      when 'A'
        :advance
      end
    end
  end

  def place(robot, details)
    robot.at(details[:x], details[:y])
    robot.orient(details[:direction])
  end

  def evaluate(robot, command_string)
    instructions(command_string).each do |command|
      case command
      when :turn_left
        robot.turn_left
      when :turn_right
        robot.turn_right
      when :advance
        robot.advance
      end
    end
  end
end
