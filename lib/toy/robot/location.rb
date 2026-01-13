# frozen_string_literal: true

class Location
  attr_reader :table, :x_unit, :y_unit

  def initialize(x_arg, y_arg, table)
    raise ValidationError, errors.join(", ") unless valid?(x_arg, y_arg, table)

    @x_unit = x_arg.to_i
    @y_unit = y_arg.to_i
    @table = table
  end

  def change(direction)
    LocationService.goto_next(self, direction)
  end

  def report
    "#{x_unit},#{y_unit}"
  end

  def x_unit=(value)
    @x_unit = value if valid?(value, y_unit, table)
  end

  def y_unit=(value)
    @y_unit = value if valid?(value, y_unit, table)
  end

  private

  attr_accessor :errors

  def valid?(x_arg, y_arg, table)
    self.errors = []
    errors << "coordinates must be numbers" if !integer?(x_arg) || !integer?(y_arg)
    errors << "Out of Table Bounds" unless table.placeable?(x_arg.to_i, y_arg.to_i)
    errors.empty?
  end

  def integer?(str)
    Integer(str)
    true
  rescue ArgumentError, TypeError
    false
  end
end
