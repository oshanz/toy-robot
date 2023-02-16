# frozen_string_literal: true

require "thor"
require_relative "robot/version"
require_relative "robot/table"
require_relative "robot/robot"
require_relative "robot/location"
require_relative "robot/direction"

## Toy Robot
class Play < Thor
  desc "start", "create a table size x,y"
  def start(x_unit, y_unit)
    @table = Table.new(x_unit.to_i, y_unit.to_i)
    @robot = Robot.new(@table)

    loop do
      command = ask("$")
      place(command) if command.start_with?("PLACE")

      say("please place the robot") && redo unless @robot.placed?

      result = @robot.send(command.downcase) if %w[MOVE LEFT RIGHT REPORT].include?(command)

      say(result) if command == "REPORT"
    end
  end

  private

  def place(command)
    args = command.delete_prefix("PLACE ").split(",")
    x = args[0].to_i
    y = args[1].to_i
    direction = args[2]

    location = Location.new(x, y)
    say("invalid direction") && return unless @table.placeable?(location)

    say("invalid direction") && return unless Direction.valid?(direction)

    @robot.place(x, y, direction)
  end
end
