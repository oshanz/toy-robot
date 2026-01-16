# frozen_string_literal: true

class Table
  def initialize(width, height)
    @width = width
    @height = height
  end

  def placeable?(x_unit, y_unit)
    return false if x_unit.negative?
    return false if y_unit.negative?
    return false if x_unit >= width
    return false if y_unit >= height

    true
  end

  private

  attr_reader :width, :height
end
