# frozen_string_literal: true

RSpec.describe Play do
  subject { described_class.new }
  let(:context) { double }
  before do
    allow_any_instance_of(PlaceCommand).to receive(:execute).and_return([context, nil])
    allow_any_instance_of(TurnLeftCommand).to receive(:execute).and_return([context, nil])
    allow_any_instance_of(TurnRightCommand).to receive(:execute).and_return([context, nil])
    allow_any_instance_of(ReportCommand).to receive(:execute).and_return([context, "0,2,NORTH"])
    allow_any_instance_of(MoveCommand).to receive(:execute).and_return([context, nil])
    allow_any_instance_of(NullCommand).to receive(:execute).and_return([context, nil])
    allow_any_instance_of(ExitCommand).to receive(:execute).and_return([context, "See You Again! 👋😃"])
  end

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
    expect(subject).to receive(:ask).with("$").and_return("place 1,2,north")
    expect(subject).to receive(:ask).with("$").and_return("report")
    expect(subject).to receive(:say).with("0,2,NORTH")
    expect(subject).to receive(:ask).with("$").and_return("exit")
    expect(subject).to receive(:say).with("See You Again! 👋😃")
    subject.start
  end

  it "says errors and ignore invalid commands" do
    allow_any_instance_of(PlaceCommand).to receive(:execute)
      .and_raise(ArgumentError,
                 "wrong number of arguments (given 1, expected 3)")
    expect(subject).to receive(:say).with("Hi! 🤠")
    expect(subject).to receive(:ask).with("$").and_return("place 1")
    expect(subject).to receive(:say).with("wrong number of arguments (given 1, expected 3)")
    expect(subject).to receive(:ask).with("$").and_return("kill robot")
    expect(subject).to receive(:ask).with("$").and_return("exit")
    expect(subject).to receive(:say).with("See You Again! 👋😃")
    subject.start
  end
end
