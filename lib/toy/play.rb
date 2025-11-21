# frozen_string_literal: true

require "thor"

class ValidationError < StandardError
end

## Toy Robot
class Play < Thor
  desc "start", "create a table size 5,5"
  def start
    say("Hi! 🤠")
    loop do
      self.prompt = ask("$")
      reply = execute_command
      say(reply) unless reply.nil?
      break if parse_command == "EXIT"
    end
  end

  private

  attr_accessor :context, :prompt

  def execute_command
        self.context, reply = command.execute(*parse_args)
        return reply unless reply.nil?
  rescue StandardError => e
        e.message
  end

  def parse_args
    prompt.scan(/\S+/)[1]&.split(",")
  end

  def parse_command
    prompt.scan(/\S+/)[0].upcase
  end

  def command
    {
      "PLACE" => PlaceCommand,
      "MOVE" => MoveCommand,
      "LEFT" => TurnLeftCommand,
      "RIGHT" => TurnRightCommand,
      "REPORT" => ReportCommand,
      "EXIT" => ExitCommand
    }.fetch(parse_command, NullCommand).new(context)
  end
end
