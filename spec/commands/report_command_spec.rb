# frozen_string_literal: true

require "toy/commands/report_command"

RSpec.describe ReportCommand do
  let(:robot) { double }
  subject { described_class.new(robot) }
  it "invoke report on robot and return location" do
    expect(robot).to receive(:report).and_return(%w[1 2 NORTH]).once
    result = subject.execute
    expect(result).to eq([robot, %w[1 2 NORTH]])
  end
end
