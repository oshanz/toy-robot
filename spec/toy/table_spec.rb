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

  it "allows 4,4 as the table boundary" do
    table = Table.new(5, 5)
    location = instance_double(Location, x_unit: 4, y_unit: 4)
    expect(table.placeable?(location)).to eq(true)
    location = instance_double(Location, x_unit: 4, y_unit: 5)
    expect(table.placeable?(location)).to eq(false)
    location = instance_double(Location, x_unit: 5, y_unit: 4)
    expect(table.placeable?(location)).to eq(false)
    location = instance_double(Location, x_unit: 5, y_unit: 5)
    expect(table.placeable?(location)).to eq(false)
  end
end
