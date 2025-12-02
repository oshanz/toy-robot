# frozen_string_literal: true

class FileController
  include ::Commandable

  def process(path)
    return "File NotFound" unless File.exist?(path)

    self.path = path
    super
  end

  private

  attr_accessor :path

  def args(line)
    line.scan(/\S+/)[1]&.upcase&.split(",")
  end

  def command(line)
    line.scan(/\S+/)[0].upcase
  end

  def commands
    File.foreach(path).map do |line|
      {
        command: command(line),
        args: args(line)
      }
    end
  end
end
