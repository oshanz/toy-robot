# frozen_string_literal: true

require "thor"

class ValidationError < StandardError
end

## Toy Robot
class Play < Thor
  desc "start", "create a table size 5,5"
  def start # rubocop:disable Metrics/MethodLength
    say("Hi! 🤠")
    loop do
      @prompt = ask("$")
      begin
        self.context, reply = command.execute(*parse_args)
        say(reply) unless reply.nil?
      rescue ValidationError => e
        say(e.message)
      end
      break if parse_command == "EXIT"
    end
  end

  private

  attr_accessor :context
  attr_reader :prompt

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
