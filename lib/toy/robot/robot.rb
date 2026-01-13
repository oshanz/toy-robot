# frozen_string_literal: true

class Robot
  def place(location, direction)
    self.location = location
    self.headed = direction
  end

  def right
    headed.switch_right
  end

  def left
    headed.switch_left
  end

  def move
    location.change(headed)
  end

  def report
    "#{location.report},#{headed.report}"
  end

  private

  attr_accessor :location, :headed
end
