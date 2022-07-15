require "toy/robot/table"
require "toy/robot/location"

RSpec.describe Table do
  it "2,3 is inside the 4,4 table" do
    expect(Table.new(4, 4).placeable?(Location.new(2, 3))).to eq(true)
  end

  it "2,3 is not inside the 2,2 table" do
    expect(Table.new(2, 3).placeable?(Location.new(2, 3))).to eq(false)
  end

  it "2,3 north from 7,7 table is 2,4" do
    expect(Table.new(7, 7).north_from(Location.new(2, 3))).to eq(Location.new(2, 4))
  end

  it "3,1 south from 3,3 table is 3,1" do
    expect(Table.new(3, 3).south_from(Location.new(3, 1))).to eq(Location.new(3, 1))
  end
end
