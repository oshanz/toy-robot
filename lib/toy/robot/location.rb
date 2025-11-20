# frozen_string_literal: true

require_relative "services/location_service"

class Location
  attr_reader :table

  def initialize(x_arg, y_arg, table)
    @x_arg = x_arg
    @y_arg = y_arg
    @table = table
    raise ValidationError, errors.join(", ") unless valid?
  end

  def change(direction)
    LocationService.goto_next(self, direction)
  end

  def report
    "#{x_unit},#{y_unit}"
  end

  def x_unit
    x_arg.to_i
  end

  def y_unit
    y_arg.to_i
  end

  private

  attr_reader :x_arg, :y_arg
  attr_accessor :errors

  def valid?
    self.errors = []
    errors << "coordinates must be numbers" if !integer?(x_arg) || !integer?(y_arg)
    errors << "Out of Table Bounds" unless table.placeable?(self)
    errors.empty?
  end

  def integer?(str)
    Integer(str)
    true
  rescue ArgumentError, TypeError
    false
  end
end
