# frozen_string_literal: true

class TurnRightCommand < BaseCommand
  def execute
    robot.right
    [robot, nil]
  end
end
