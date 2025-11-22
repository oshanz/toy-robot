# frozen_string_literal: true

RSpec.describe TurnLeftCommand do
  let(:robot) { double(left: nil, right: nil) }
  let(:result) { subject.execute }

  subject { described_class.new(robot) }
  it_behaves_like "Commands/BaseCommand"

  it "call left on the robot" do
    expect(robot).to receive(:left).once
    result
  end
end
