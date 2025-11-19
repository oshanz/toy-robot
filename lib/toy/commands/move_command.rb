# frozen_string_literal: true

class MoveCommand < BaseCommand
  def execute
    [robot.move, nil]
  end
end
