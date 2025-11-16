class MoveCommand < BaseCommand
  def execute
    robot.move
  end
end
