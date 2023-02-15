# frozen_string_literal: true

require_relative "robot/version"
require "thor"
require_relative "robot/table"
require_relative "robot/robot"

module Toy
  module Robot
    class Error < StandardError; end
    # Your code goes here...
  end
end

class Play < Thor
  desc "start", "create a table size x,y"
  def start(x, y)
    table = Table.new(x.to_i, y.to_i)
    @robot = Robot.new(table)

    while true
      command = ask("$")
      place(command) if command.include? "place"

      result = @robot.send(command) if %w[move left right report].include?(command)

      say(result) if command == "report"
    end
  end

  private

  def place(command)
    x = command.delete_prefix("place ").split(",")[0].to_i
    y = command.delete_prefix("place ").split(",")[1].to_i
    direction = command.delete_prefix("place ").split(",")[2]
    @robot.place(x, y, direction)
  end
end

Play.start(ARGV)
