# frozen_string_literal: true

module Commandable
  def process(_arg)
    commands.each do |hash|
      hash => { command:, args: }
      self.state, reply = commands_map.fetch(command, invalid_command).new(state).execute(*args)
      next if reply.nil?
      return reply unless block_given?

      yield(reply)
    end
    nil
  end

  def commands_map
    {
      "PLACE" => PlaceCommand,
      "MOVE" => MoveCommand,
      "LEFT" => TurnLeftCommand,
      "RIGHT" => TurnRightCommand,
      "REPORT" => ReportCommand
    }.merge(local_commands_map)
  end

  def invalid_command
    NullCommand
  end

  private

  attr_accessor :state

  def local_commands_map
    {}
  end

  def commands
    raise NotImplementedError
  end
end
