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

  it "support lowercase commands" do
    expect(subject).to receive(:say).with("Hi! 🤠")
    expect(subject).to receive(:ask).with("$").and_return("place 1,2,west")
    expect(subject).to receive(:ask).with("$").and_return("report")
    expect(subject).to receive(:say).with("1,2,WEST")
    expect(subject).to receive(:ask).with("$").and_return("exit")
    expect(subject).to receive(:say).with("See You Again! 👋😃")
    subject.start
  end

  it "says errors and ignore invalid commands" do
    expect(subject).to receive(:say).with("Hi! 🤠")
    expect(subject).to receive(:ask).with("$").and_return("place 1")
    expect(subject).to receive(:say).with("wrong number of arguments (given 1, expected 3)")
    expect(subject).to receive(:ask).with("$").and_return("kill robot")
    expect(subject).to receive(:ask).with("$").and_return("exit")
    expect(subject).to receive(:say).with("See You Again! 👋😃")
    subject.start
  end
end
