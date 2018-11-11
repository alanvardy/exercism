class SpaceAge
  attr_reader :on_earth, :on_mercury, :on_venus, :on_mars,
              :on_jupiter, :on_saturn, :on_uranus, :on_neptune

  RELATIVE_ORBITAL_PERIODS = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  def initialize(age)
    @age = age
    @on_earth = relative_years(:earth)
    @on_mercury = relative_years(:mercury)
    @on_venus = relative_years(:venus)
    @on_mars = relative_years(:mars)
    @on_jupiter = relative_years(:jupiter)
    @on_saturn = relative_years(:saturn)
    @on_uranus = relative_years(:uranus)
    @on_neptune = relative_years(:neptune)
  end

  private

  def relative_years(planet)
    (@age / (31_557_600.00 * RELATIVE_ORBITAL_PERIODS[planet])).round(2)
  end
end
