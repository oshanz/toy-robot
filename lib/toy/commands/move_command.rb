# frozen_string_literal: true

class MoveCommand < BaseCommand
  def execute
    robot.move
  end
end
