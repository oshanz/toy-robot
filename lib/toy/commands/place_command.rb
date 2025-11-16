class PlaceCommand < BaseCommand
  attr_reader :table

  def initialize(robot)
    @table = Table.new(5, 5)
    robot = Robot.new if robot.nil?
    super(robot)
  end

  def execute(x, y, direction)
    location = Location.new(x.to_i, y.to_i, table)
    direction = Direction.new(direction)

    robot.place(location, direction)
  end
end
