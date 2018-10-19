class CollatzConjecture
  def self.steps(number)
    raise ArgumentError, 'Invalid input' if number < 1

    @@num_steps = 0
    next_step(number)
    @@num_steps
  end

  def self.next_step(number)
    return if number == 1

    @@num_steps += 1
    if number.even?
      next_step(number / 2)
    else
      next_step(number * 3 + 1)
    end
  end
end
