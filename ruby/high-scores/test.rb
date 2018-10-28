class ImAClass
  def self.declare
    "I'm a class method!"
  end

  def declare
    "I'm an instance method!"
  end
end

puts ImAClass.declare
# => "I'm a class method!"

im_an_instance = ImAClass.new
puts im_an_instance.declare
# => "I'm an instance method!"
