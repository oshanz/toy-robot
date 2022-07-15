require_relative "location"

class Robot
  @location = nil
  @headed = nil

  def place(x_cord, y_cord, direction)
    throw "invlid location" unless Location.valid?(x_cord, y_cord)

    @location = Location.new(x_cord, y_cord)
    @headed = direction
  end

  def right
    @headed = Direction.right_of(@headed)
  end

  def left
    @headed = Direction.left_of(@headed)
  end

  def move
    @location.move(@headed)
  end

  def report
    [@location.x_cord, @location.y_cord, @headed]
  end
end
