# frozen_string_literal: true

class ExitCommand < BaseCommand
  def execute
    [nil, "See You Again! 👋😃"]
  end

  private

  def robot_required?
    false
  end
end
