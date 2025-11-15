require "toy/robot/direction"

RSpec.describe Direction do
  it "return left from north" do
    direction = Direction.new("NORTH")
    direction.switch_left
    expect(direction.report).to eq(Direction::WEST)
  end

  it "return right from south" do
    direction = Direction.new("SOUTH")
    direction.switch_right
    expect(direction.report).to eq(Direction::WEST)
  end

  it "prevent Invalid direction" do
    expect { Direction.new("WOW") }.to raise_error("Invalid Direction")
  end
end
