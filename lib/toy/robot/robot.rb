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
    case @headed
    when Direction::NORTH
      @location = @table.north_from(@location)
    when Direction::EAST
      @location = @table.east_from(@location)
    when Direction::WEST
      @location = @table.west_from(@location)
    when Direction::SOUTH
      @location = @table.south_from(@location)
    end
  end

  def report
    [@location.x_unit, @location.y_unit, @headed]
  end
end
