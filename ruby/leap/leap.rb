class Year
  def self.leap?(_year)
    return true if _year % 400 == 0
    if _year % 4 != 0
      return false
    elsif _year % 100 != 0
      return true
    else
      return false
    end
  end
end
