class Anagram
  def initialize(word)
    @word = word.downcase
    @sorted = @word.chars.sort.join
  end

  def match(words)
    words.select do |word|
      word.downcase.chars.sort.join == @sorted &&
        word.downcase != @word
    end
  end
end
