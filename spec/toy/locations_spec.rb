require "toy/robot/location"

RSpec.describe Location do
  it "0,0 is a valid" do
    expect(Location.valid?(0, 0)).to eq(true)
  end

  it "0,-1 is a invalid" do
    expect(Location.valid?(0, -1)).to eq(false)
  end

  it "-1,0 is a invalid" do
    expect(Location.valid?(-1, 0)).to eq(false)
  end

  it "5,5 is a invalid" do
    expect(Location.valid?(5, 5)).to eq(false)
  end
end
