# frozen_string_literal: true

class FileController
  include ::Commandable

  def process(path)
    return "File NotFound" unless File.exist?(path)

    File.foreach(path) do |line|
      self.line = line
      reply = super
      yield(reply) unless reply.nil?
    end
  end

  private

  attr_accessor :line, :path

  def args
    line.scan(/\S+/)[1]&.upcase&.split(",")
  end

  def command
    line.scan(/\S+/)[0].upcase
  end
end
