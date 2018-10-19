class Acronym
  def self.abbreviate(name)
    words = name.split(/\s|-/)
    acronym = ''
    words.each do |word|
      next unless word =~ /\w/

      acronym += word[0].upcase
    end
    acronym
  end
end
