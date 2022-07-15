# frozen_string_literal: true

require "toy/robot/robot"
require "toy/robot/direction"
require "toy/robot/table"

RSpec.describe Toy::Robot do
  before(:all) do
    @table = Table.new(5, 5)
  end

  before(:each) do
    @robot = Robot.new(@table)
  end

  it "can be placed" do
    @robot.place(2, 2, Direction::NORTH)
    x, y, direction = @robot.report
    expect(x).to eq(2)
    expect(y).to eq(2)
    expect(direction).to eq(Direction::NORTH)
  end

  it "can turn right" do
    @robot.place(2, 2, Direction::NORTH)
    @robot.right
    x, y, direction = @robot.report
    expect(x).to eq(2)
    expect(y).to eq(2)
    expect(direction).to eq(Direction::EAST)
  end

  it "can turn left" do
    @robot.place(0, 0, Direction::NORTH)
    @robot.left
    x, y, direction = @robot.report
    expect(x).to eq(0)
    expect(y).to eq(0)
    expect(direction).to eq(Direction::WEST)
  end

  it "can move north from 0,0" do
    @robot.place(0, 0, Direction::NORTH)
    @robot.move
    x, y, direction = @robot.report
    expect(x).to eq(0)
    expect(y).to eq(1)
    expect(direction).to eq(Direction::NORTH)
  end

  it "can move and turn left" do
    @robot.place(1, 2, Direction::EAST)
    @robot.move
    @robot.move
    @robot.left
    @robot.move
    x, y, direction = @robot.report
    expect(x).to eq(3)
    expect(y).to eq(3)
    expect(direction).to eq(Direction::NORTH)
  end

  it "ignore invlid moves north west" do
    @robot.place(0, 4, Direction::NORTH)
    @robot.move
    @robot.left
    @robot.move
    x, y, direction = @robot.report
    expect(x).to eq(0)
    expect(y).to eq(4)
    expect(direction).to eq(Direction::WEST)
  end

  it "ignore invlid moves south east" do
    @robot.place(4, 0, Direction::EAST)
    @robot.move
    @robot.right
    @robot.move
    x, y, direction = @robot.report
    expect(x).to eq(4)
    expect(y).to eq(0)
    expect(direction).to eq(Direction::SOUTH)
  end
end
