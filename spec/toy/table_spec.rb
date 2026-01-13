# frozen_string_literal: true

RSpec.describe Table do
  it "can hold if location is within the boundary" do
    table = Table.new(4, 4)
    expect(table.placeable?(2, 3)).to eq(true)
  end

  it "can't hold if location is out of the boundary" do
    table = Table.new(2, 2)
    expect(table.placeable?(2, 3)).to eq(false)
  end

  it "can't hold negative locations" do
    table = Table.new(2, 2)
    expect(table.placeable?(-1, 3)).to eq(false)
  end
end
