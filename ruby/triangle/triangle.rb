class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    unique_sides?([1])
  end

  def isosceles?
    unique_sides?([1, 2])
  end

  def scalene?
    unique_sides?([3])
  end

  def unique_sides?(sides)
    sides.include?(@sides.uniq.length) && valid_triangle?
  end

  def valid_triangle?
    has_area = @sides.all? do |side|
      (@sides.sum - side * 2) > 0
    end
    @sides.min > 0 && has_area
  end
end
