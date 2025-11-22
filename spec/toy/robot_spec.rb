# frozen_string_literal: true

RSpec.describe Robot do
  subject(:robot) { described_class.new }
  let(:location) { instance_double(Location, report: "1,2") }
  let(:direction) { instance_double(Direction, direction: "NORTH", report: "NORTH") }

  it "can be placed" do
    result = robot.place(location, direction)
    expect(result).to be(robot)
  end

  it "can turn right" do
    robot.place(location, direction)
    expect(direction).to receive(:switch_right)
    result = robot.right
    expect(result).to be(robot)
  end

  it "can turn left" do
    robot.place(location, direction)
    expect(direction).to receive(:switch_left)
    result = robot.left
    expect(result).to be(robot)
  end

  it "can report" do
    robot.place(location, direction)
    result = robot.report
    expect(result).to eq("1,2,NORTH")
  end

  it "can move" do
    robot.place(location, direction)
    expect(location).to receive(:change).with(direction)
    result = robot.move
    expect(result).to be(robot)
  end
end
