# frozen_string_literal: true

require_relative "location"
require_relative "table"
require_relative "direction"

class Robot
  attr_accessor :location, :headed

  def place(location, direction)
    @location = location
    @headed = direction
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
    location.report + [headed.report]
  end

  def placed?
    !location.nil?
  end
end
