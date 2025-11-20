# frozen_string_literal: true

require "toy/play"

RSpec.describe Play do
  subject { described_class.new }

  it "execute on place, left, right, move and report" do
    expect(subject).to receive(:say).with("Hi! 🤠")
    expect(subject).to receive(:ask).with("$").and_return("PLACE 1,2,NORTH")
    expect(subject).to receive(:ask).with("$").and_return("LEFT")
    expect(subject).to receive(:ask).with("$").and_return("MOVE")
    expect(subject).to receive(:ask).with("$").and_return("RIGHT")
    expect(subject).to receive(:ask).with("$").and_return("REPORT")
    expect(subject).to receive(:say).with("0,2,NORTH")
    expect(subject).to receive(:ask).with("$").and_return("EXIT")
    expect(subject).to receive(:say).with("See You Again! 👋😃")
    subject.start
  end
end
