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

  def north_from(location)
    Location.new(location.x_unit, location.y_unit + 1, self)
  rescue ValidationError
    location
  end

  def south_from(location)
    Location.new(location.x_unit, location.y_unit - 1, self)
  rescue ValidationError
    location
  end

  def west_from(location)
    Location.new(location.x_unit - 1, location.y_unit, self)
  rescue ValidationError
    location
  end

  def east_from(location)
    Location.new(location.x_unit + 1, location.y_unit, self)
  rescue ValidationError
    location
  end
end
