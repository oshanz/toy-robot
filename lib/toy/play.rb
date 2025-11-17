# frozen_string_literal: true

require "thor"
require_relative "robot/version"
require_relative "robot/table"
require_relative "robot/robot"
require_relative "robot/location"
require_relative "robot/direction"
require_relative "commands/base_command"
require_relative "commands/move_command"
require_relative "commands/place_command"
require_relative "commands/report_command"
require_relative "commands/turn_command"
require_relative "commands/exit_command"
require_relative "commands/null_command"

class ValidationError < StandardError
end

## Toy Robot
class Play < Thor
  attr_accessor :robot
  attr_reader :prompt

  desc "start", "create a table size 5,5"
  def start # rubocop:disable Metrics/MethodLength
    say("Hi! 🤠")
    loop do
      @prompt = ask("$")
      begin
        self.robot, reply = parse_command.execute(*parse_args)
        say(reply) unless reply.nil?
      rescue ValidationError => e
        say(e.message)
      end
      break if command == "EXIT"
    end
  end

  private

  def parse_args
    prompt.scan(/\S+/)[1]&.split(",")
  end

  def command
    prompt.scan(/\S+/)[0]
  end

  def parse_command
    {
      "PLACE" => PlaceCommand,
      "MOVE" => MoveCommand,
      "LEFT" => TurnCommand::LEFT,
      "RIGHT" => TurnCommand::RIGHT,
      "REPORT" => ReportCommand,
      "EXIT" => ExitCommand
    }.fetch(command, NullCommand).new(robot)
  end
end
