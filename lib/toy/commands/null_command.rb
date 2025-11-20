# frozen_string_literal: true

class NullCommand < BaseCommand
  def execute
    [robot, nil]
  end

  private

  def robot_required?
    false
  end
end
