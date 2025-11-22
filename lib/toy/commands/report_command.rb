# frozen_string_literal: true

class ReportCommand < BaseCommand
  def execute
    [robot, robot.report]
  end
end
