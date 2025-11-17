# frozen_string_literal: true

module TurnCommand
  class LEFT < BaseCommand
    def execute
      robot.left
    end
  end

  class RIGHT < BaseCommand
    def execute
      robot.right
    end
  end
end
