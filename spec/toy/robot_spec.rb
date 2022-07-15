# frozen_string_literal: true

RSpec.describe Toy::Robot do
  it "can be placed" do
    robot = Robot.new
    robot.place(2, 2, Direction::NORTH)
    x, y, direction = robot.report
    expect(x).to eq(2)
    expect(y).to eq(2)
    expect(direction).to_eq = Direction::NORTH
  end

  it "can turn right" do
    robot = Robot.new
    robot.place(2, 2, Direction::NORTH)
    robot.trun(Direction::RIGHT)
    x, y, direction = robot.report
    expect(x).to eq(2)
    expect(y).to eq(2)
    expect(direction).to_eq = Direction::EAST
  end

  it "can turn left" do
    robot = Robot.new
    robot.place(0, 0, Direction::NORTH)
    robot.trun(Direction::LEFT)
    x, y, direction = robot.report
    expect(x).to eq(0)
    expect(y).to eq(0)
    expect(direction).to_eq = Direction::WEST
  end

  it "can move north from 0,0" do
    robot = Robot.new
    robot.place(0, 0, Direction::NORTH)
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(0)
    expect(y).to eq(1)
    expect(direction).to_eq = Direction::NORTH
  end

  it "can move and turn left" do
    robot = Robot.new
    robot.place(1, 2, Direction::EAST)
    robot.move
    robot.move
    robot.trun(Direction::LEFT)
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(3)
    expect(y).to eq(3)
    expect(direction).to_eq = Direction::NORTH
  end

  it "ignore invlid moves north west" do
    robot = Robot.new
    robot.place(0, 4, Direction::NORTH)
    robot.move
    robot.trun(Direction::LEFT)
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(0)
    expect(y).to eq(4)
    expect(direction).to_eq = Direction::WEST
  end

  it "ignore invlid moves south east" do
    robot = Robot.new
    robot.place(4, 0, Direction::EAST)
    robot.move
    robot.trun(Direction::RIGHT)
    robot.move
    x, y, direction = robot.report
    expect(x).to eq(4)
    expect(y).to eq(0)
    expect(direction).to_eq = Direction::SOUTH
  end
end
