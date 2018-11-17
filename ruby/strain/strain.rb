class Array
  def keep
    result = []
    each do |item|
      result << item if yield item
    end
    result
  end

  def discard
    result = []
    each do |item|
      result << item unless yield item
    end
    result
  end
end
