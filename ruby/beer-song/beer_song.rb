module BeerSong
  class << self
    def recite(bottles, verses)
      @bottles = bottles
      result = ''
      loop do
        result << "#{pluralize.capitalize} on the wall, #{pluralize}.\n"
        result << "#{deal_with_beer} #{pluralize} on the wall.\n"
        verses -= 1
        break if verses < 1

        result << "\n"
      end
      result
    end

    def pluralize
      case @bottles
      when 0
        'no more bottles of beer'
      when 1
        '1 bottle of beer'
      else
        "#{@bottles} bottles of beer"
      end
    end

    def deal_with_beer
      if @bottles.zero?
        @bottles = 99
        'Go to the store and buy some more,'
      else
        @bottles -= 1
        "Take #{@bottles.zero? ? 'it' : 'one'} down and pass it around,"
      end
    end
  end
end
