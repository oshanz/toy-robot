class ExitCommand < BaseCommand
  def initialize(_args)
    @a = 1
  end

  def execute
    [nil, "See You Again! 👋😃"]
  end
end
