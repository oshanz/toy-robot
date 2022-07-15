require_relative 'location'

class Robot
  @location = nil
  @headed = nil

  def place(x_cord, y_cord, direction)
    @location = Location.new(x_cord, y_cord)
    @headed = direction
  end

  def turn_right
    @headed = Direction.right_of(@headed)
  end

  def turn_left
    @headed = Direction.left_of(@headed)
  end

  def move
    @location.move(@headed)
  end

  def report
    [@location.x_cord, @location.y_cord, @headed]
  end
end