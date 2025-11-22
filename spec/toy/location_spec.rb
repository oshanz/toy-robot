# frozen_string_literal: true

RSpec.describe Location do
  let(:table) { instance_double(Table, placeable?: true) }
  let(:location) { described_class.new(2, 1, table) }
  let(:direction) { instance_double(Direction) }
  it "report coordinates" do
    expect(location.report).to eq("2,1")
  end

  it "change location" do
    expect(LocationService).to receive(:goto_next).with(location, direction).and_return(location)
    result = location.change(direction)
    expect(result).to be(location)
  end

  it "raise Error when location out of table bounds" do
    allow(table).to receive(:placeable?).and_return(false)
    expect { Location.new(2, 7, table) }.to raise_error("Out of Table Bounds")
  end

  it "raise an error on invalid coordinates" do
    expect { Location.new("a", 2, table) }.to raise_error(ValidationError, "coordinates must be numbers")
    expect { Location.new(3, "c", table) }.to raise_error(ValidationError, "coordinates must be numbers")
    expect { Location.new("x", "c", table) }.to raise_error(ValidationError, "coordinates must be numbers")
    expect { Location.new(nil, 3, table) }.to raise_error(ValidationError, "coordinates must be numbers")
  end
end
