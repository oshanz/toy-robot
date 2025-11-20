# frozen_string_literal: true

require "toy/robot/location"

RSpec.describe Location do
  let(:table) { Table.new(5, 5) }
  it "report coordinates" do
    location = Location.new(2, 1, table)
    expect(location.report).to eq("2,1")
  end

  it "raise Error when location out of table bounds" do
    expect { Location.new(2, 7, table) }.to raise_error("Out of Table Bounds")
    expect { Location.new(6, 1, table) }.to raise_error("Out of Table Bounds")
    expect { Location.new(-1, 7, table) }.to raise_error("Out of Table Bounds")
    expect { Location.new(2, -1, table) }.to raise_error("Out of Table Bounds")
    expect { Location.new(5, 5, table) }.to raise_error("Out of Table Bounds")
  end

  it "raise an error on invalid coordinates" do
    expect { Location.new("a", 2, table) }.to raise_error(ValidationError, "coordinates must be numbers")
    expect { Location.new(3, "c", table) }.to raise_error(ValidationError, "coordinates must be numbers")
    expect { Location.new("x", "c", table) }.to raise_error(ValidationError, "coordinates must be numbers")
    expect { Location.new(nil, 3, table) }.to raise_error(ValidationError, "coordinates must be numbers")
  end
end
