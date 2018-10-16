class FlattenArray
  def self.flatten(nested_lists)
    @@final_array = []
    flattify(nested_lists)
    @@final_array
  end

  def self.flattify(list)
    if list.is_a? Array
      list.each { |sub_item| flattify(sub_item) }
    elsif list.nil?
      nil
    else
      @@final_array << list
    end
  end
end
