# frozen_string_literal: true

require "thor"

class ValidationError < StandardError
end

## Toy Robot
class Play < Thor
  desc "interactive game", ""
  def start
    self.cli_controller = CliController.new
    say("Hi! 🤠")
    loop do
      prompt = ask("$")
      reply = execute_command(prompt)
      say(reply) unless reply.nil?
      break if prompt.upcase == "EXIT"
    end
  end

  desc "file read game", ""
  def read
    self.file_controller = FileController.new
    path = ask("file path?")
    reply = process_file(path) do |out|
      say(out)
    end
    say(reply) unless reply.nil?
  end

  private

  attr_accessor :cli_controller, :file_controller

  def execute_command(prompt)
    reply = cli_controller.process(prompt)
    reply unless reply.nil?
  rescue StandardError => e
    e.message
  end

  def process_file(path, &)
    file_controller.process(path, &)
  end
end
