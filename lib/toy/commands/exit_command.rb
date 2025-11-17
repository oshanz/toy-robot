# frozen_string_literal: true

class ExitCommand < BaseCommand
  def initialize(_args) # rubocop:disable Lint/MissingSuper
    @a = 1
  end

  def execute
    [nil, "See You Again! 👋😃"]
  end
end
