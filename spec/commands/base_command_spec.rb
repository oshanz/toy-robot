# frozen_string_literal: true

RSpec.shared_examples "Commands/BaseCommand" do
  it "execute should return an array" do
    expect(result).to be_an(Array)
    expect(result.length).to be(2)
    expect(result[0]).to be(robot)
    expect(result[1]).to be_a(String).or be_nil
  end
end

RSpec.describe BaseCommand do
  let(:robot) { nil }
  subject { described_class.new(robot) }
  it "raise validation error when robot not provided" do
    expect { subject }.to raise_error(ValidationError, "Robot was not placed")
  end
end
