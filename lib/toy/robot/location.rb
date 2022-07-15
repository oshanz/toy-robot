class Location
  attr_reader :x_unit, :y_unit

  def initialize(x_unit, y_unit)
    @x_unit = x_unit
    @y_unit = y_unit
  end
end
