# frozen_string_literal: true

require "toy/commands/move_command"

RSpec.describe MoveCommand do
  let(:robot) { instance_double(Robot, move: nil) }
  subject { described_class.new(robot) }
  let(:result) { subject.execute }

  it_behaves_like "Commands/BaseCommand"

  it "invoke move on robot" do
    expect(robot).to receive(:move).once
    result
  end
end
