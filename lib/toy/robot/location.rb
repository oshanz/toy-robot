class Location
  attr_reader :x_unit, :y_unit, :table

  def initialize(x_unit, y_unit, table)
    @x_unit = x_unit
    @y_unit = y_unit
    @table = table
    errors = valid?
    raise ValidationError, errors.join(", ") unless errors.empty?
  end

  def change(direction)
    case direction.direction
    when Direction::NORTH
      table.north_from(self)
    when Direction::EAST
      table.east_from(self)
    when Direction::WEST
      table.west_from(self)
    when Direction::SOUTH
      table.south_from(self)
    end
  end

  def report
    [x_unit, y_unit]
  end

  def valid?
    errors = []
    errors << "Out of Table Bounds" unless table.placeable?(self)
    errors
  end
end
