# frozen_string_literal: true

module Commandable
  def process(_arg)
    self.state, reply = commands.fetch(command, invalid_command).new(state).execute(*args)
    reply
  end

  def commands
    {
      "PLACE" => PlaceCommand,
      "MOVE" => MoveCommand,
      "LEFT" => TurnLeftCommand,
      "RIGHT" => TurnRightCommand,
      "REPORT" => ReportCommand,
      "EXIT" => ExitCommand
    }
  end

  def invalid_command
    NullCommand
  end

  private

  attr_accessor :state

  def command
    raise NotImplementedError
  end

  def args
    raise NotImplementedError
  end
end
