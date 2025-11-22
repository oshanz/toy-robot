# frozen_string_literal: true

RSpec.describe Table do
  it "can hold if location is within the boundary" do
    table = Table.new(4, 4)
    location = instance_double(Location, x_unit: 2, y_unit: 3)
    expect(table.placeable?(location)).to eq(true)
  end

  it "can't hold if location is out of the boundary" do
    table = Table.new(2, 2)
    location = instance_double(Location, x_unit: 2, y_unit: 3)
    expect(table.placeable?(location)).to eq(false)
  end

  it "can't hold negative locations" do
    table = Table.new(2, 2)
    location = instance_double(Location, x_unit: -1, y_unit: 3)
    expect(table.placeable?(location)).to eq(false)
  end
end
