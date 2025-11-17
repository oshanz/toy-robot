# frozen_string_literal: true

require "toy/commands/move_command"

RSpec.describe MoveCommand do
  let(:robot) { double }
  subject { described_class.new(robot) }
  it "invoke move on robot" do
    expect(robot).to receive(:move).once
    subject.execute
  end
end
