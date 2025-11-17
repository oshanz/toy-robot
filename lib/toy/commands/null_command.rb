# frozen_string_literal: true

class NullCommand < BaseCommand
  def execute
    [robot, nil]
  end
end
