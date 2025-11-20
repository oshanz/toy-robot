# frozen_string_literal: true

require "toy/robot/direction"

RSpec.describe Direction do
  it "return left from north" do
    direction = Direction.new("NORTH")
    %w[WEST SOUTH EAST NORTH].each do |headed|
      direction.switch_left
      expect(direction.report).to eq(headed)
    end
  end

  it "return right from south" do
    direction = Direction.new("NORTH")
    %w[EAST SOUTH WEST NORTH].each do |headed|
      direction.switch_right
      expect(direction.report).to eq(headed)
    end
  end

  it "prevent Invalid direction" do
    expect { Direction.new("WOW") }.to raise_error("Invalid Direction")
  end
end
