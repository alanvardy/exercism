class Isogram
  def self.isogram?(word)
    letters = word.downcase.scan(/\w/)
    letters.none? { |char| letters.count(char) > 1 }
  end
end
