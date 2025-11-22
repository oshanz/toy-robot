# frozen_string_literal: true

class Robot
  def place(location, direction)
    self.location = location
    self.headed = direction
    self
  end

  def right
    headed.switch_right
    self
  end

  def left
    headed.switch_left
    self
  end

  def move
    self.location = location.change(headed)
    self
  end

  def report
    "#{location.report},#{headed.report}"
  end

  private

  attr_accessor :location, :headed
end
