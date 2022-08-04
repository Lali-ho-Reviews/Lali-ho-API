require 'rails_helper'

RSpec.describe Company, type: :model do
  subject {
    described_class.new(
      name: "Free Company",
      slogan: "This is a slogan",
      rank: 10,
      ff_id: "999999999999999999",
      members: 15, 
      server: "Test [Server]"
    )
  }
  it "is a valid Company example with all attributes" do
    expect(subject).to be_valid
  end

  it "is not a valid company without name attribute" do
    subject.name = ""
    expect(subject).not_to be_valid
  end

  it "is not a valid company without ff_id attribute" do
    subject.ff_id = ""
    expect(subject).not_to be_valid
  end

  it "is not a valid company without server attribute" do
    subject.server = ""
    expect(subject).not_to be_valid
  end

  
end
