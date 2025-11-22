# frozen_string_literal: true

RSpec.describe NullCommand do
  let(:robot) { nil }
  subject { described_class.new(robot) }
  let(:result) { subject.execute }

  it_behaves_like "Commands/BaseCommand"

  it "returns nil message" do
    expect(subject.execute).to eq([nil, nil])
  end

  it "supports optional args list" do
    expect(subject.execute(nil)).to eq([nil, nil])
    expect(subject.execute(["-a", "ls"])).to eq([nil, nil])
  end
end
