# frozen_string_literal: true

class PlaceCommand < BaseCommand
  attr_reader :table

  def initialize(robot)
    @table = Table.new(5, 5)
    robot = Robot.new if robot.nil?
    super(robot)
  end

  def execute(x_unit, y_unit, direction)
    location = Location.new(x_unit.to_i, y_unit.to_i, table)
    direction = Direction.new(direction)

    [robot.place(location, direction), nil]
  end
end
