require "toy/commands/place_command"

RSpec.describe PlaceCommand do
  let(:robot) { double }
  subject { described_class.new(robot) }
  it "invoke place on robot" do
    expect(robot).to receive(:place).with(anything, anything).once
    subject.execute("1", "3", "NORTH")
  end
end
