# frozen_string_literal: true

RSpec.describe ExitCommand do
  let(:robot) { nil }
  subject { described_class.new(robot) }
  let(:result) { subject.execute }

  it_behaves_like "Commands/BaseCommand"

  it "returns exit message" do
    expect(result).to eq([nil, "See You Again! 👋😃"])
    result
  end
end
