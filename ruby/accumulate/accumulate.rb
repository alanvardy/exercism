class Array
  def accumulate
    result = []
    each do |x|
      result << yield(x)
    end
    result
  end
end
