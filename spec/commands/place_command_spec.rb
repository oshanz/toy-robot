# frozen_string_literal: true

RSpec.describe PlaceCommand do
  let(:robot) { double(place: nil) }
  subject { described_class.new(robot) }
  let(:args) { %w[1 3 NORTH] }
  let(:result) { subject.execute(*args) }

  it_behaves_like "Commands/BaseCommand"

  it "invoke place on robot" do
    expect(robot).to receive(:place).with(
      an_instance_of(Location).and(having_attributes(
                                     x_unit: 1,
                                     y_unit: 3
                                   )),
      an_instance_of(Direction).and(having_attributes(direction: "NORTH"))
    ).once
    result
  end
end
