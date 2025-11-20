# frozen_string_literal: true

class PlaceCommand < BaseCommand
  def initialize(robot)
    @errors = []
    @table = Table.new(5, 5)
    robot = Robot.new if robot.nil?
    super
  end

  def execute(x_unit, y_unit, direction)
    location = Location.new(x_unit, y_unit, table)
    direction = Direction.new(direction)
    robot.place(location, direction)
    [robot, nil]
  end

  private

  attr_reader :table
end
