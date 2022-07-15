require_relative "location"
require_relative "table"

class Robot
  @location = nil
  @headed = nil
  @table = nil

  def initialize(table)
    @table = table
  end

  def place(x_unit, y_unit, direction)
    @location = Location.new(x_unit, y_unit)
    throw "invlid location" unless @table.placeable?(@location)

    @headed = direction
  end

  def right
    @headed = Direction.right_of(@headed)
  end

  def left
    @headed = Direction.left_of(@headed)
  end

  def move
    next_location = nil

    case @headed
    when Direction::NORTH
      next_location = @table.north_unit(@location)
    when Direction::EAST
      next_location = @table.east_unit(@location)
    when Direction::WEST
      next_location = @table.west_unit(@location)
    when Direction::SOUTH
      next_location = @table.south_unit(@location)
    else
      throw "invlid direction"
    end
    @location = next_location
  end

  def report
    [@location.x_unit, @location.y_unit, @headed]
  end
end
