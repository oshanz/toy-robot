# frozen_string_literal: true

class CliController
  include ::Commandable

  def process(prompt)
    self.prompt = prompt
    super
  end

  private

  attr_accessor :prompt

  def command
    prompt.scan(/\S+/)[0].upcase
  end

  def args
    prompt.scan(/\S+/)[1]&.upcase&.split(",")
  end

  def commands
    [
      { command:, args: }
    ]
  end

  def local_commands_map
    {
      "EXIT" => ExitCommand
    }
  end
end
