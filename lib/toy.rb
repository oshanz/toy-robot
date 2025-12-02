# frozen_string_literal: true

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
# loader.push_dir("#{__dir__}/toy")
loader.collapse("#{__dir__}/toy")
loader.collapse("#{__dir__}/toy/robot")
loader.collapse("#{__dir__}/toy/commands")
loader.collapse("#{__dir__}/toy/controllers")
loader.collapse("#{__dir__}/toy/robot/services")
loader.setup

module Toy
end

loader.eager_load
