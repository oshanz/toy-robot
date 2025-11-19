# frozen_string_literal: true

require "toy/robot/table"
require "toy/robot/location"

RSpec.describe Table do
  it "4,4 can hold 2,3" do
    table = Table.new(4, 4)
    location = instance_double(Location, x_unit: 2, y_unit: 3)
    expect(table.placeable?(location)).to eq(true)
  end

  it "2,2 can't hold 2,3" do
    table = Table.new(2, 2)
    location = instance_double(Location, x_unit: 2, y_unit: 3)
    expect(table.placeable?(location)).to eq(false)
  end

  it "2,2 can't hold -1,3" do
    table = Table.new(2, 2)
    location = instance_double(Location, x_unit: -1, y_unit: 3)
    expect(table.placeable?(location)).to eq(false)
  end

  it "2,3 north from 7,7 table is 2,4" do
    table = Table.new(7, 7)
    location = instance_double(Location, x_unit: 2, y_unit: 3)
    location = table.north_from(location)
    expect(location.x_unit).to eq(2)
    expect(location.y_unit).to eq(4)
  end

  it "3,3, start 3,1 south is 3,1" do
    table = Table.new(3, 3)
    location = instance_double(Location, x_unit: 3, y_unit: 1)
    location = table.south_from(location)
    expect(location.x_unit).to eq(3)
    expect(location.y_unit).to eq(1)
  end
end
