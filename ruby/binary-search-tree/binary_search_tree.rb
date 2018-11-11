class Bst
  attr_reader :data, :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(new_data)
    if new_data <= @data
      if @left.nil?
        @left = Bst.new(new_data)
      else
        @left.insert(new_data)
      end
    else
      if @right.nil?
        @right = Bst.new(new_data)
      else
        @right.insert(new_data)
      end
    end
  end

  def each(&block)
    read_data.each(&block)
  end

  def read_data
    result = []
    result += @left.read_data unless @left.nil?
    result << @data
    result += @right.read_data unless @right.nil?
    result
  end
end
