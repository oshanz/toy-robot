require_relative "location"

class Table
  @width = nil
  @height = nil

  def initialize(width, height)
    @width = width
    @height = height
  end

  def placeable?(location)
    return false if location.x_unit >= @width || location.x_unit.negative? # prevent falling
    return false if location.y_unit >= @width || location.y_unit.negative? # prevent falling

    true
  end

  def north_from(location)
    nextlocation = Location.new(location.x_unit, location.y_unit + 1)
    placeable?(nextlocation) ? nextlocation : location
  end

  def south_from(location)
    nextlocation = Location.new(location.x_unit, location.y_unit - 1)
    placeable?(nextlocation) ? nextlocation : location
  end

  def west_from(location)
    nextlocation = Location.new(location.x_unit - 1, location.y_unit)
    placeable?(nextlocation) ? nextlocation : location
  end

  def east_from(location)
    nextlocation = Location.new(location.x_unit + 1, location.y_unit)
    placeable?(nextlocation) ? nextlocation : location
  end
end
