#!/usr/bin/env ruby
# frozen_string_literal: true

require "rubygems"
require_relative "lib/toy/play"

Dir.glob("lib/**/*.rb").each do |file|
  require_relative file
end

Play.start(ARGV)
