require "toy/robot/location"

RSpec.describe Location do
  it "report coordinates" do
    location = Location.new(2, 1, Table.new(5, 5))
    expect(location.report).to eq([2, 1])
  end

  it "raise Error when location out of table bounds" do
    expect { Location.new(2, 7, Table.new(5, 5)) }.to raise_error("Out of Table Bounds")
    expect { Location.new(6, 1, Table.new(5, 5)) }.to raise_error("Out of Table Bounds")
    expect { Location.new(-1, 7, Table.new(5, 5)) }.to raise_error("Out of Table Bounds")
    expect { Location.new(2, -1, Table.new(5, 5)) }.to raise_error("Out of Table Bounds")
  end
end
