# frozen_string_literal: true

require "toy/commands/place_command"

RSpec.describe PlaceCommand do
  let(:robot) { double(place: nil) }
  subject { described_class.new(robot) }
  let(:args) { %w[1 3 NORTH] }
  let(:result) { subject.execute(*args) }

  it_behaves_like "Commands/BaseCommand"

  it "invoke place on robot" do
    expect(robot).to receive(:place).with(anything, anything).once
    result
  end
end
