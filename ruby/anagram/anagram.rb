class Anagram
  def initialize(word)
    @word = word.downcase
    @sorted = @word.chars.sort.join
  end

  def match(words)
    anagrams = []
    words.each do |word|
      next if word.downcase == @word
      anagrams << word if word.downcase.chars.sort.join == @sorted
    end
    anagrams
  end
end
