require "toy/robot/direction"

RSpec.describe Direction do
  it "return left from north" do
    expect(Direction.left_of(Direction::NORTH)).to eq(Direction::WEST)
  end

  it "return right from south" do
    expect(Direction.left_of(Direction::SOUTH)).to eq(Direction::EAST)
  end
end
