# frozen_string_literal: true

require "toy/robot/robot"
require "toy/robot/direction"
require "toy/robot/table"
require "toy/robot/location"

RSpec.describe Toy::Robot do
  let(:table) { Table.new(5, 5) }
  subject(:robot) { Robot.new }

  it "can be placed" do
    location = Location.new(2, 2, table)
    robot.place(location, Direction.new("NORTH"))
    x, y, direction = robot.report
    expect(x).to eq(2)
    expect(y).to eq(2)
    expect(direction).to eq(Direction::NORTH)
  end

  it "can turn right" do
    location = Location.new(2, 2, table)
    robot.place(location, Direction.new("NORTH"))
    robot.right
    x, y, direction = robot.report
    expect(x).to eq(2)
    expect(y).to eq(2)
    expect(direction).to eq(Direction::EAST)
  end

  it "can turn left" do
    location = Location.new(0, 0, table)
    robot.place(location, Direction.new("NORTH"))
    robot.left
    x, y, direction = robot.report
    expect(x).to eq(0)
    expect(y).to eq(0)
    expect(direction).to eq(Direction::WEST)
  end

  it "can move north from 0,0" do
    location = Location.new(0, 0, table)
    robot.place(location, Direction.new("NORTH"))
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(0)
    expect(y).to eq(1)
    expect(direction).to eq(Direction::NORTH)
  end

  it "can move and turn left" do
    location = Location.new(1, 2, table)
    robot.place(location, Direction.new("EAST"))
    robot.move
    robot.move
    robot.left
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(3)
    expect(y).to eq(3)
    expect(direction).to eq(Direction::NORTH)
  end

  it "ignore invalid moves north west" do
    location = Location.new(0, 4, table)
    robot.place(location, Direction.new("NORTH"))
    robot.move
    robot.left
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(0)
    expect(y).to eq(5)
    expect(direction).to eq(Direction::WEST)
  end

  it "ignore invalid moves south east" do
    location = Location.new(4, 0, table)
    robot.place(location, Direction.new("EAST"))
    robot.move
    robot.right
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(5)
    expect(y).to eq(0)
    expect(direction).to eq(Direction::SOUTH)
  end
end
