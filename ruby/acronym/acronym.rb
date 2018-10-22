class Acronym
  def self.abbreviate(sentence)
    sentence.scan(/\b(\w)\w|(I)/).join.upcase
  end
end
