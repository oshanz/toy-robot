
class Location
  attr_reader :x_cord, :y_cord

  def initialize(x_cord, y_cord)
    @x_cord = x_cord
    @y_cord = y_cord
  end

  def valid?(x_cord, y_cord)
    return false if x_cord > 4 || x_cord.negative? # 5x5 box boundries
    return false if y_cord > 4 || y_cord.negative? # 5x5 box boundries

    true
  end

  def move(direction)
    next_x_cord = @x_cord
    next_y_cord = @y_cord

    case direction
    when Direction::NORTH
      next_y_cord = @y_cord + 1
    when Direction::EAST
      next_x_cord = @x_cord + 1
    when Direction::WEST
      next_x_cord = @x_cord - 1
    when Direction::SOUTH
      next_y_cord = @y_cord - 1
    else
      throw "can't move, invalid direction"
    end
    return unless valid?(next_x_cord, next_y_cord) # don't exceed boundries

    @x_cord = next_x_cord
    @y_cord = next_y_cord
  end
end
