# frozen_string_literal: true

require_relative "services/location_service"

class Location
  attr_reader :x_unit, :y_unit, :table

  def initialize(x_unit, y_unit, table)
    @x_unit = x_unit
    @y_unit = y_unit
    @table = table
    errors = valid?
    raise ValidationError, errors.join(", ") unless errors.empty?
  end

  def change(direction)
    LocationService.goto_next(self, direction)
  end

  def report
    [x_unit, y_unit]
  end

  def valid?
    errors = []
    errors << "Out of Table Bounds" unless table.placeable?(self)
    errors
  end
end
