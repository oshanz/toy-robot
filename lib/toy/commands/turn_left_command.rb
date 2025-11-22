# frozen_string_literal: true

class TurnLeftCommand < BaseCommand
  def execute
    robot.left
    [robot, nil]
  end
end
