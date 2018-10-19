class Pangram
  def self.pangram?(sentence)
    ('a'..'z').each do |letter|
      return false unless sentence.downcase.include?(letter)
    end
    true
  end
end
