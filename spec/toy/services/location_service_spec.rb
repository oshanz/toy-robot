# frozen_string_literal: true

RSpec.describe LocationService do
  let(:table) { instance_double(Table) }
  let(:location) { instance_double(Location, x_unit: 2, y_unit: 2, table:) }
  let(:direction) { instance_double(Direction) }

  before(:example) do
    allow(location).to receive(:x_unit=) { |x|
      allow(location).to receive(:x_unit).and_return(x)
    }
    allow(location).to receive(:y_unit=) { |y|
      allow(location).to receive(:y_unit).and_return(y)
    }
  end

  it "returns next location" do
    allow(table).to receive(:placeable?).and_return(true)
    [["NORTH", 2, 3], ["EAST", 3, 2], ["WEST", 1, 2], ["SOUTH", 2, 1]].each do |position|
      location.x_unit = 2
      location.y_unit = 2
      allow(direction).to receive(:report).and_return(position[0])
      described_class.goto_next(location, direction)
      expect(location).to have_attributes(x_unit: position[1], y_unit: position[2], table:)
    end
  end
end
