RSpec.shared_examples "Commands/BaseCommand" do
  it "execute should return an array" do
    expect(result).to be_an(Array)
  end
end
