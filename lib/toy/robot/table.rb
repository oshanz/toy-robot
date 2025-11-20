# frozen_string_literal: true

class Table
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

  private

  attr_reader :width, :height
end
