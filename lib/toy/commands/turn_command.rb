# frozen_string_literal: true

module TurnCommand
  class LEFT < BaseCommand
    def execute
      [robot.left, nil]
    end
  end

  class RIGHT < BaseCommand
    def execute
      [robot.right, nil]
    end
  end
end
