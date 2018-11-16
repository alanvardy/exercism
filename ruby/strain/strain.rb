class Array
  def keep
    result = []
    each do |item|
      result << item if yield(item)
    end
  end
end
