class NullCommand < BaseCommand
  def execute
    [nil, "Invalid Command"]
  end
end
