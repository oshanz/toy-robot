require "toy/commands/turn_command"

RSpec.describe TurnCommand do
  let(:robot) { double(left: nil, right: nil) }
  let(:result) { subject.execute }
  describe "LEFT" do
    subject { TurnCommand::LEFT.new(robot) }
    it_behaves_like "Commands/BaseCommand"

    it "call left on the robot" do
      expect(robot).to receive(:left).once
      result
    end
  end

  describe "RIGHT" do
    subject { TurnCommand::RIGHT.new(robot) }
    it_behaves_like "Commands/BaseCommand"

    it "call right on the robot" do
      expect(robot).to receive(:right).once
      result
    end
  end
end
