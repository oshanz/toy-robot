# frozen_string_literal: true

require_relative "location"

class Table
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def placeable?(location)
    return false if location.x_unit >= width
    return false if location.y_unit >= height
    return false if location.x_unit.negative?
    return false if location.y_unit.negative?

    true
  end
end
