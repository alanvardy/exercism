class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    counts = {}
    list = @phrase.downcase.scan(/[a-z'0-9]+/)
    list.each do |item|
      if item =~ /'\w+'/
        puts "match!"
        item = /'(\w+)'/.match(item)[1]
      end
      if counts.key?(item)
        counts[item] += 1
      else
        counts[item] = 1
      end
    end
    counts
  end
end