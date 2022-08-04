require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      username: "User",
      email: "email@email.com",
      password: "123",
      password_confirmation: "123",
      isAdmin: false
    )
  }

  it "is a valid user with all attributes" do
    expect(subject).to be_valid
  end

  # it "is not a valid user with username attribute missing" do
  #   subject.username = ""
  #   expect(subject).to be_valid
  # end

end
