# frozen_string_literal: true

RSpec.describe LocationService do
  it "2,3 north from 7,7 table is 2,4" do
    table = Table.new(7, 7)
    location = instance_double(Location, x_unit: 2, y_unit: 3, table:)
    location = described_class.goto_next(location, Direction.new("NORTH"))
    expect(location.x_unit).to eq(2)
    expect(location.y_unit).to eq(4)
  end

  it "3,3, start 3,1 south is 3,1" do
    table = Table.new(3, 3)
    location = instance_double(Location, x_unit: 3, y_unit: 1, table:)
    location = described_class.goto_next(location, Direction.new("SOUTH"))
    expect(location.x_unit).to eq(3)
    expect(location.y_unit).to eq(1)
  end

  it "Table 3,3, from position 0,0, EAST is 0,0" do
    table = Table.new(3, 3)
    location = instance_double(Location, x_unit: 2, y_unit: 0, table:)
    location = described_class.goto_next(location, Direction.new("EAST"))
    expect(location.x_unit).to eq(2)
    expect(location.y_unit).to eq(0)
  end

  it "Table 3,3, from position 0,0, EAST is 0,0" do
    table = Table.new(3, 3)
    location = instance_double(Location, x_unit: 2, y_unit: 0, table:)
    location = described_class.goto_next(location, Direction.new("WEST"))
    expect(location.x_unit).to eq(1)
    expect(location.y_unit).to eq(0)
  end
end
