# frozen_string_literal: true

RSpec.describe LocationService do
  let(:table) { instance_double(Table) }
  let(:location) { instance_double(Location, x_unit: 2, y_unit: 2, table:) }
  let(:direction) { instance_double(Direction) }
  it "returns next location" do
    allow(table).to receive(:placeable?).and_return(true)
    [["NORTH", 2, 3], ["EAST", 3, 2], ["WEST", 1, 2], ["SOUTH", 2, 1]].each do |position|
      allow(direction).to receive(:report).and_return(position[0])
      result = described_class.goto_next(location, direction)
      expect(result).to be_a(Location).and have_attributes(x_unit: position[1], y_unit: position[2], table:)
    end
  end

  it "returns same location when reached the boundary" do
    allow(table).to receive(:placeable?).and_return(false)
    %w[NORTH EAST WEST SOUTH].each do |headed|
      allow(direction).to receive(:report).and_return(headed)
      result = described_class.goto_next(location, direction)
      expect(result).to be(location)
    end
  end
end
