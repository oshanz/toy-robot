# frozen_string_literal: true

RSpec.describe Robot do
  subject(:robot) { described_class.new }
  let(:location) { instance_double(Location, report: "1,2") }
  let(:direction) { instance_double(Direction, direction: "NORTH", report: "NORTH") }

  it "can be placed" do
    expect(robot).to receive(:place).with(location, direction).once
    robot.place(location, direction)
  end

  it "can turn right" do
    robot.place(location, direction)
    expect(direction).to receive(:switch_right)
    robot.right
  end

  it "can turn left" do
    robot.place(location, direction)
    expect(direction).to receive(:switch_left)
    robot.left
  end

  it "can report" do
    robot.place(location, direction)
    result = robot.report
    expect(result).to eq("1,2,NORTH")
  end

  it "can move" do
    robot.place(location, direction)
    expect(location).to receive(:change).with(direction)
    robot.move
  end
end
