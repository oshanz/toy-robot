# frozen_string_literal: true

RSpec.shared_examples "Commands/BaseCommand" do
  it "execute should return an array" do
    expect(result).to be_an(Array)
    # expect(result[0]).to be(an_instance_of(Robot))
  end
end
