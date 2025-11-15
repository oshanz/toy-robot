require_relative "location"
require_relative "table"
require_relative "direction"

class Robot
  attr_accessor :location, :headed

  def place(location, direction)
    @location = location
    @headed = direction
  end

  def right
    headed.switch_right
  end

  def left
    headed.switch_left
  end

  def move
    self.location = location.change(headed)
  end

  def report
    location.report + [headed.report]
  end

  def placed?
    !location.nil?
  end
end
