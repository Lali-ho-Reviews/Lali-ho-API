require 'rails_helper'

RSpec.describe Review, type: :model do
  subject {
    described_class.new(
      author: "Anonymous",
      text: "This is a review",
      company_id: 1,
      user_id: 1,
      rating: 5
    )
  }
  # it "is a valid review example with all attributes" do
  #   expect(subject).to be_valid
  # end

  it "is not a valid company without text attribute" do
    subject.text = ""
    expect(subject).not_to be_valid
  end

  it "is not a valid company without associated company" do
    subject.company_id = ""
    expect(subject).not_to be_valid
  end

  it "is not a valid company without rating attribute" do
    subject.rating = ""
    expect(subject).not_to be_valid
  end

  
end
