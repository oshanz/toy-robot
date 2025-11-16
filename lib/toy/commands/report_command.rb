class ReportCommand < BaseCommand
  def execute
    [robot, robot.report]
  end
end
